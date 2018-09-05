class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @history = get_simple_user_history
    data_and_labels = get_bar_chart_data(@user)
    @data = data_and_labels.map { |e| e[0] }
    @labels = data_and_labels.map { |e| e[1] }
    @scores = get_user_skill_scores_for_form(@user)
  end

  def interests
    @user = User.friendly.find(params[:id])
    redirect_to root_path unless current_user == @user
    @scores = get_user_skill_scores_for_form(@user)
  end

  def skill_scores
    user = User.find(params[:user])
    uncheck_and_zero_all_user_scores(user)
    skill_scores = get_skill_scores(params)
    check_and_augment_skill_scores(skill_scores, skill_scores.count)
    redirect_to user_profile_path(user)
  end

  private

  def get_user_skill_scores_for_form(user)
    user.skill_scores.sort_by { |score| score.sub_category.name }
  end

  def uncheck_and_zero_all_user_scores(user)
    user.skill_scores.each do |skill_score|
      skill_score.checked = false
      skill_score.skill_score = 0
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

  def check_and_augment_skill_scores(skill_scores, number)
    skill_score_value = (100 / number)
    skill_scores.each do |skill_score|
      skill_score.checked = true
      skill_score.skill_score = skill_score_value
      skill_score.save
    end
  end

  def get_bar_chart_data(user)
    skill_scores = user.skill_scores.where(checked: true)
    # data = []
    # labels = []
    data = skill_scores.map do |score|
      [(score.skill_score + (score.viewed_videos * 2)), score.sub_category.name]
    end
    data = data.sort_by { |score| score[0] }
    data.first(5)
  end

  def get_bar_chart_labels(user)

  end

  def get_simple_user_history
    # Get most recent 10 videos, unique by video_id
    @user.histories.order(updated_at: :desc).uniq { |history| history.video_id }.first(12)
  end
end
