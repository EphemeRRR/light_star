class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @data = calculate_scores
  end

  def recieve_interest_choices
    get_sub_categories(params)
  end

  private

  def get_sub_categories(params)
    # Define array to store parameters
    params_array = []
    # Grab only sub_category parameters
    params.each { |param| params_array << param }
    # Each parameters was an array, now take only first value
    # of array which is the sub_category_id
    sub_category_ids = params_array[2..-4].map { |array| array[0] }
    augment_user_scores(sub_category_ids)
  end

  def augment_user_scores(user_score_array)

  end

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
