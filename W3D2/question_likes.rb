require_relative 'questionsDBConnection'

class Question_likes
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| Question_likes.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       user_id
      FROM
       question_likes
      WHERE
        question_id = "#{question_id}"
      SQL
  end

  def liked_questions_for_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       question_id
      FROM
       question_likes
      WHERE
        user_id = "#{user_id}"
      SQL
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       COUNT (question_id)
      FROM
       question_likes
      WHERE
        question_id = "#{question_id}"
      SQL
  end

  def self.most_liked_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       COUNT (question_id)
      FROM
       question_likes
      GROUP BY 
        question_id
      ORDER BY
      question_id DESC
      LIMIT "#{n}"
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
        question_likes (question_id, user_id)
      VALUES
        (?, ?)
    SQL
    @user_id , @question_id  = followers_for_question_id(question_id)
  end

  def update
    raise "#{self} not in database" unless @question_id && @user_id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id , @user_id)
      UPDATE
        question_likes
      SET
        question_id = ?, user_id = ?
      WHERE
        question_id = "#{@question_id}", user_id = "#{@user_id}"
    SQL
  end


end
