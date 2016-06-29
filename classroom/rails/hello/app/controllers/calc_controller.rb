class CalcController < ApplicationController
  def add
    @add = params[:num1].to_i+params[:num2].to_i
  end

  def sub
    @sub = params[:num1].to_i-params[:num2].to_i
  end
end
