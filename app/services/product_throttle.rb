class ProductThrottle
  CYCLE = 0.5

  def call
    # Initializing
    start_time = Time.now

    1.upto(total_pages_count) do |page|
      unless page == 1
        stop_time = Time.now
        puts "Last batch processing started at #{start_time.strftime('%I:%M:%S%p')}"
        puts "The time is now #{stop_time.strftime('%I:%M:%S%p')}"

        processing_duration = stop_time - start_time
        puts "The processing lasted #{processing_duration.to_i} seconds."
        wait_time = (CYCLE - processing_duration).ceil
        puts "We have to wait #{wait_time} seconds then we will resume."
        sleep wait_time if wait_time > 0
        start_time = Time.now
      end

      puts "Doing page #{page}/#{total_pages_count}..."
      products = ShopifyAPI::Product.find(:all, params: { limit: 250, page: page })

      products.each do |product|
        ProductSync.new(product).call
      end
    end
  end

  private

  def total_pages_count
    (total_product_count / 250.0).ceil
  end

  def total_product_count
    @total_product_count ||= ShopifyAPI::Product.count
  end
end
