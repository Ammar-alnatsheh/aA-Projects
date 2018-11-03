require_relative 'questionsDBConnection'

class Reply
  attr_accessor :question_id, :author_id, :body, :parent_reply_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       replies
      WHERE
        user_id = "#{user_id}"
      SQL
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       replies
      WHERE
        question_id = "#{question_id}"
      SQL
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @author_id = options['author_id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id, @author_id, @body, @parent_reply_id)
      INSERT INTO
        replies (question_id, author_id, body, parent_reply_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    @id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    QuestionsDBConnection.instance.execute(<<-SQL, @question_id, @author_id, @body, @parent_reply_id, @id)
      UPDATE
        replies
      SET
        question_id = ?, author_id = ?, body = ?, parent_reply_id = ?)
      WHERE
        id = ?
    SQL
  end

  def author
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       users.fname, users.lname
      FROM
       replies
       JOIN
        users
        ON users.id = replies.author_id
      WHERE
        replies.id = "#{@id}"
      SQL

  end

  def question
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
       *
      FROM
       replies
       JOIN
        questions
        ON questions.id = replies.id
      WHERE
        replies.id = "#{@id}"
      SQL

  end

def parent_reply
  data = QuestionsDBConnection.instance.execute(<<-SQL)
    SELECT
     *
    FROM
     replies
    WHERE
      parent_reply_id = "#{@id}"
    SQL

end

def child_replies
  data = QuestionsDBConnection.instance.execute(<<-SQL)
    SELECT
     *
    FROM
     replies
    WHERE
      quest_id = "#{@id}"
    SQL
end


end
