class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(
    name: params[:account][:name])
    @account.save
    if not @account.valid?
      redirect_to accounts_path
    else
      render :new
    end
  end

  def index
    @accounts = Account.all
  end

end
