require_relative 'questionsDBConnection'

class Users
  attr_accessor :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| Users.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       users
      WHERE
        id = "#{id}"
      SQL
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       users
      WHERE
        fname = "#{fname}" AND lname = "#{lname}"
      SQL
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

  def authored_questions
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       questions
      WHERE
        author_id = "#{@id}"
      SQL
  end

  def authored_replies
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       replies
      WHERE
        author_id = "#{@id}"
      SQL
  end

  def followed_questions
    QuestionFollow.all.select{|obj| obj.user_id == @id}
  end

  def liked_questions
    QuestionFollow.liked_questions_for_user_id(@id)
  end

  def average_karma
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       COUNT( question_likes.user_id ) ,COUNT( DISTINCT questions.author_id )
      FROM
       question_likes
       LEFT OUTER JOIN
        questions
        ON
          question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = "#{@id}"
      SQL

  end

end
