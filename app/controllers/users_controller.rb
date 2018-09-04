class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @history = get_simple_user_history
    # @data = calculate_scores
    # @labels = ["Physiques, Chimies & Technologies",
    #        "Terre & Univers", "Les Vivants", "Sports & Santés"]
    #        #  ["Physiques, Chimies & Technologies",
    #        # "Terre & Univers", "Les Vivants", "Sports & Santés",
    #        #  "Cultures & Sociétés", "Langues & Languages",
    #        #  "Mathématiques", "Histoires", "Techniques"]
    @scores = @user.skill_scores
  end

  def recieve_interest_choices
    raise
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
    @sub_categories = SubCategory.all
    user_score_array.each do |id|
      sub_category = SubCategory.find(id)
      user_score = SkillScore.find_by(sub_category: sub_category, user: current_user)
      user_score.skill_score += 20
      raise
    end
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

    [physique, techniques, terre, vivants, sports]

  end

  def get_simple_user_history
    # Get most recent 10 videos, unique by video_id
    @user.histories.order(created_at: :desc).uniq { |history| history.video_id }.first(10)
  end
end
