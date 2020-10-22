require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
    include Singleton 

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        result = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        return nil unless result.length > 0
        
        Question.new(result.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end

class User
    attr_accessor :id, :fname, :lname

    def self.find_by_name(fname, lname)
        user_data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
        *
        FROM 
        users
        WHERE
        fname = ? AND lname = ?
        SQL

        return nil unless user_data.length > 0
        
        User.new(user_data.first)
    end

    def self.find_by_id(id)
        result = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = ?
        SQL
        return nil unless result.length > 0
        
        User.new(result.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def insert
        raise "#{self} already exists in database" if self.fname && self.lname
        QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
        INSERT INTO 
            users(fname, lname)
        VALUES
            (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end
end

p User.find_by_id(2)



