class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @data = calculate_scores
  end

  def choose_categories
   end

  private

  def calculate_scores

    physique = 45
    terre = 22
    vivants = 16
    sports = 12
    cultures = 45
    langues = 40
    mathematiques = 1
    historie = 4
    techniques = 36

    [physique, terre, vivants, sports, cultures, langues, mathematiques, historie, techniques]

  end
end
