require_relative 'questionsDBConnection'

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def followers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       question_follows
       join
       usres
       on usres.id = question_follows.question_id
      WHERE
        question_follows.question_id = "#{question_id}"
      SQL
  end

  def followed_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       question_follows
      WHERE
        user_id = "#{user_id}"
      SQL
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def create
    raise "#{self} already in database" if @question_id && @user_id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id , @user_id)
      INSERT INTO
        question_follows (question_id, user_id)
      VALUES
        (?, ?)
    SQL
    @user_id , @question_id  = followers_for_question_id(question_id)
  end

  def update
    raise "#{self} not in database" unless @question_id && @user_id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id , @user_id)
      UPDATE
        question_follows
      SET
        question_id = ?, user_id = ?
      WHERE
        question_id = "#{@question_id}", user_id = "#{@user_id}"
    SQL
  end

  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       question_id
      FROM
       question_follows
      GROUP BY question_id
      ORDER BY question_id DESC LIMIT "#{n}"
      SQL

  end

end
