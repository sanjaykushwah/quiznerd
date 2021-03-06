#:nodoc:
class QuizEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_quiz, only: [:new, :create, :delete, :update]

  def index
    @quiz_events = load_quiz_events
    @count = QuizEvent.count
  end

  def show
    load_quiz_event
    flash.now[:notice] =
      'It appears you did not finish the quiz, but your score as of the ' \
      'last question you answered was preserved for you.' unless completed?
  end

  def new
    @quiz_event = build_quiz_event
  end

  def edit
    load_quiz_event
  end

  def create
    @quiz_event = build_quiz_event
    if @quiz_event.save
      @quiz_taking_form = build_form
      render 'edit'
    else
      render 'new'
    end
  end

  def update
    load_quiz_event
    @quiz_taking_form ||= build_form
    @quiz_taking_form.submit(quiz_event_params)
    render 'edit'
  end

  def destroy
    load_quiz_event
    @quiz_event.destroy
    redirect_to redirect_path, success: 'Quiz event successfully destroyed.'
  end

  def clear
    current_user.quiz_events.destroy_all
    redirect_to quiz_events_path, success: 'History successfully cleared!'
  end

  private

  def completed?
    @quiz_event.completed?
  end

  def redirect_path
    return_to_index? ? quiz_events_path : root_path
  end

  def load_quiz_events
    QuizEvent.search_quizzes_taken(
      params[:search], current_user)
      .paginate(page: params[:page])
  end

  def load_quiz
    quiz_id = params[:quiz_id] || quiz_event_params[:quiz_id]
    @quiz ||= Quiz.find_by(id: quiz_id)
    redirect_to(root_path, error: quiz_deleted) and return unless @quiz
  end

  def build_quiz_event
    current_user.quiz_events.build(quiz: @quiz)
  end

  def build_form
    QuizTakingForm.new(quiz_event: @quiz_event, view_context: view_context)
  end

  def quiz_deleted
    'The author must have deleted that quiz just now. Sorry!'
  end

  def load_quiz_event
    @quiz_event ||= current_user.quiz_events.find_by(id: params[:id])
  end

  def return_to_index?
    params[:return_to].present? && params[:return_to] == 'index'
  end

  # If radio button is the selector, we get a single string, if
  # check boxes are the selectors, we get an array of strings.
  # We want an array of integers all the time.
  def convert_answer_ids
    ids = params[:quiz_event][:answer_ids] if params[:quiz_event]
    params[:quiz_event][:answer_ids] =
      ids.split.flatten.reject(&:blank?).map(&:to_i) if ids
  end

  # Note that answer_ids can be a single value (radio button) or multiple
  # values (check boxes), thus it appears in this list both ways and we have
  # to convert it.
  def quiz_event_params
    convert_answer_ids
    params.require(:quiz_event).permit(
      :id, :quiz_id, :question_id, { answer_ids: [] }, :answer_ids)
  end
end
