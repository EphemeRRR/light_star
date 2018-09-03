[1mdiff --git a/app/controllers/pages_controller.rb b/app/controllers/pages_controller.rb[m
[1mindex 477faff..011f9af 100644[m
[1m--- a/app/controllers/pages_controller.rb[m
[1m+++ b/app/controllers/pages_controller.rb[m
[36m@@ -1,5 +1,6 @@[m
 class PagesController < ApplicationController[m
   skip_before_action :authenticate_user!, only: [:home][m
[32m+[m[32m  # before_action :set_video_category, only: [:create_tag][m
 [m
   def home[m
     # @array = [][m
[36m@@ -9,5 +10,38 @@[m [mclass PagesController < ApplicationController[m
 [m
     #   @array << vid[m
     # end[m
[32m+[m
[32m+[m[32m    # @video_category = VideoCategory.new[m
[32m+[m[32m    # @videos = Video.all[m
[32m+[m[32m    # @sub_categories = SubCategory.all[m
   end[m
[32m+[m
[32m+[m[32m  # def new_tag[m
[32m+[m[32m  #   @video_category = VideoCategory.new[m
[32m+[m[32m  #   @videos = Video.all[m
[32m+[m[32m  #   @sub_categories = SubCategory.all[m
[32m+[m[32m  # end[m
[32m+[m
[32m+[m[32m  # def create_tag[m
[32m+[m[32m  #   @video_category = VideoCategory.new(video_category_params)[m
[32m+[m[32m  #   if @video_category.save[m
[32m+[m[32m  #     redirect_to video_path(@video_category.video.id)[m
[32m+[m[32m  #   else[m
[32m+[m[32m  #     render 'new_tag'[m
[32m+[m[32m  #   end[m
[32m+[m[32m  # end[m
[32m+[m
[32m+[m[32m  # private[m
[32m+[m[32m  #   # Use callbacks to share common setup or constraints between actions.[m
[32m+[m[32m  #   def set_video_category[m
[32m+[m[32m  #     @video_category = VideoCategory.find(params[:id])[m
[32m+[m[32m  #   end[m
[32m+[m
[32m+[m[32m  #   # Never trust parameters from the scary internet, only allow the white list through.[m
[32m+[m[32m  #   def video_category_params[m
[32m+[m[32m  #     params.require(:video_category).permit(:sub_category_id, :video_id, :relevance)[m
[32m+[m[32m  #   end[m
[32m+[m
[32m+[m
[32m+[m
 end[m
[1mdiff --git a/app/controllers/videos_controller.rb b/app/controllers/videos_controller.rb[m
[1mindex c95b0e1..19c31f7 100644[m
[1m--- a/app/controllers/videos_controller.rb[m
[1m+++ b/app/controllers/videos_controller.rb[m
[36m@@ -13,6 +13,7 @@[m [mclass VideosController < ApplicationController[m
   def show[m
     #[m
     create_history_and_increment_score[m
[32m+[m[32m    @video_categories = VideoCategory.where("video_id = #{@video.id}")[m
   end[m
 [m
   def search[m
[1mdiff --git a/app/views/pages/home.html.erb b/app/views/pages/home.html.erb[m
[1mindex 3453cf2..12c5ce4 100644[m
[1m--- a/app/views/pages/home.html.erb[m
[1m+++ b/app/views/pages/home.html.erb[m
[36m@@ -1,2 +1,3 @@[m
[31m-<h1>Pages#home</h1>[m
[31m-<p>Find me in app/views/pages/home.html.erb</p>[m
[32m+[m[32m<h1>Pages#home => link videos to subCategories</h1>[m
[32m+[m
[32m+[m[32m<p><%= link_to "add a new tag", new_tag_path %></p>[m
[1mdiff --git a/app/views/videos/show.html.erb b/app/views/videos/show.html.erb[m
[1mindex f51c05e..e46faa9 100644[m
[1m--- a/app/views/videos/show.html.erb[m
[1m+++ b/app/views/videos/show.html.erb[m
[36m@@ -6,4 +6,8 @@[m
   <p>Vidéo d'introduction : <%= @video.introduction %></p>[m
   <p>Vidéo professionnalisante : <%= @video.pro %></p>[m
   <p>Vidéo vérifiée : <%= @video.verified %></p>[m
[32m+[m[32m  <p>Vidéo subcategories :</p>[m
[32m+[m[32m  <% @video_categories.each do |video_category| %>[m
[32m+[m[32m    <ul><li><%= video_category.sub_category.name %> => <%= video_category.relevance %>%</li></ul>[m
[32m+[m[32m  <% end %>[m
 </div>[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 8232f97..b4536a4 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -1,6 +1,8 @@[m
 Rails.application.routes.draw do[m
   devise_for :users[m
   # get 'pages/home', to: 'pages#home'[m
[32m+[m[32m  # get 'pages/new_tag', to: 'pages#new_tag', as: 'new_tag'[m
[32m+[m[32m  # post 'pages/home', to: 'pages#create_tag'[m
   get 'videos/search', to: 'videos#search'[m
   get 'videos/:id', to: 'videos#show', as: 'video'[m
   root to: 'videos#index'[m
