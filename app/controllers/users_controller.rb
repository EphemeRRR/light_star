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
    @scores = get_user_skill_scores_for_form(@user)
  end

  def interests
    @user = User.friendly.find(params[:id])
    @scores = get_user_skill_scores_for_form(@user)
  end

  def skill_scores
    user = User.find(params[:user])
    all_user_skill_scores_unchecked(user)
    skill_scores = get_skill_scores(params)
    check_skill_scores(skill_scores)
    redirect_to user_profile_path(user)
  end

  private

  def get_user_skill_scores_for_form(user)
    user.skill_scores.sort_by { |score| score.sub_category.name }
  end

  def all_user_skill_scores_unchecked(user)
    user.skill_scores.each do |skill_score|
      skill_score.checked = false
      skill_score.save
    end
  end

  def get_skill_scores(params)
    # Define array to store parameters
    params_array = []
    # Grab only sub_category parameters
    params.each { |param| params_array << param }
    # Each parameter was an array, now take only first value
    # of array which is the skill_score_id
    skill_score_ids = params_array[3..-4].map { |array| array[0] }
    skill_scores = skill_score_ids.map { |id| SkillScore.find(id) }
    # raise
  end

  def check_skill_scores(skill_scores)
    skill_scores.each do |skill_score|
      skill_score.checked = true
      skill_score.save
    end
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
