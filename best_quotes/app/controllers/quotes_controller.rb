class QuotesController < Rulers::Controller
  
  def a_quote
    @noun = "HardCoder"
    @description = "HardCoder codes everything hard"
    render :a_quote, :permit => [:noun, :description]
  end
end