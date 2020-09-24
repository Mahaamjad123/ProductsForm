class ProductsController < ApplicationController

   def new 
      @product = Product.new
      # @product.build_feedback
      @product.feedbacks.build
   end

   def create
    # render plain: params[:product].inspect
    @product = Product.new(product_params)

      if @product.save 
         redirect_to product_path(@product) 
      else
         render :new 
       end
   end

   def show 
       @product = Product.find(params[:id])
      #  render json: @product
   end 

   def upload
      uploaded_file = params[:logo]
      File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
         file.write(uploaded_file.read)
    end
  end

   private
  def product_params
      params.require(:product).permit(:company_name, :city, :image, :email, :address, :contact_number, :product_name, :item_code, :regular_price, :sale_price, :quantity, :mfg_date, :exp_date, :catagory, :product_description, :agreement, feedbacks_attributes: [:id , :product_id , :name , :body])
  end

end
