require_relative 'questionsDBConnection'

class Questions
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Questions.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       questions
      WHERE
        id = "#{id}"
      SQL
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       questions
      WHERE
        author_id = "#{author_id}"
      SQL
  end

  def self.most_liked(n)
    QuestionFollow.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id, @id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
  end

  def author
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       users.fname, users.lname
      FROM
       questions
       JOIN
        users
        ON users.id = questions.author_id
      WHERE
        questions.id = "#{@id}"
      SQL
  end

  def replies
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       replies
      WHERE
        questions_id = "#{@id}"
      SQL
  end

  def followers
    QuestionFollow.all.select{|obj| obj.question_id == @id}
  end

  def most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def likers
    Question_likes.likers_for_question_id(@id)
  end

  def num_likes
    Question_likes.num_likes_for_question_id(@id)
  end

end
