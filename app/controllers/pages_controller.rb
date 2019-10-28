class PagesController < ApplicationController
    # before_filter :authorize, only: [:edit, :update]
    def index
        
    end

    def journal
        if current_user  == nil
            redirect_to '/signup'
        else
            @questions = Question.all
            
            
        end
    end

    def submit_answer

        answer = Answer.new
        answer.user_id = current_user.id
        answer.question_id = params[:question_id].to_i
        answer.answer = params[:answer]
        answer.save

        puts "=================="
        puts "Question: " +  answer.question_id.to_s
        puts "User id: " + answer.user_id.to_s
        puts "Answered: " + answer.answer
        puts "================="

        
        
        redirect_to '/journal'
    end

    def show_answers
        if current_user  == nil
            redirect_to '/signup'
        else
            # this gets all answers submitted ever
            # @allAnswers = Answer.all

            # this gets all answers submitted only by the current user
            @allAnswers = current_user.answers
        end
    end


end
