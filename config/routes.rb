Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#positive_feedbacks'
  get 'home/positive_feedbacks' => 'home#positive_feedbacks'
  get 'home/negative_feedbacks' => 'home#negative_feedbacks'
  get 'home/topics' => 'home#topics'
  get 'home/topic_details' => 'home#topic_details'
  get 'home/charts' => 'home#charts'
end
