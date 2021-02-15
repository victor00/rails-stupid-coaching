class QuestionsController < ApplicationController
  def ask; end

  def answer
    @user_input = params[:ask]
    @coach_answer = coach(@user_input)
  end

  def coach(user_input)
    coach_answers = {
      "I am going to work": 'Great!',
      "?": 'Silly question, get dressed and go to work!',
      "default": "I don't care, get dressed and go to work!"
    }
    if coach_answers.key?(user_input.to_sym)
      coach_answers[user_input.to_sym]
    elsif coach_answers.key?(user_input[-1].to_sym)
      coach_answers[user_input[-1].to_sym]
    else
      coach_answers[:default]
    end
  end
end
