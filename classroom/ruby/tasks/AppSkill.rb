module App
  class Person
    attr_accessor :id, :name, :email, :roles

    def initialize(id, name, email)
      @id = id
      @name = name.downcase
      @email = email
      @roles = []
    end

  end

  class Role
    attr_accessor :skills, :name

    def initialize(name)
      @name = name
      @skills = []
    end

  end

  class SkillUtil

    def initialize()
      @people = []
    end

    def load()
      people_file = "alunos.csv"
      people_csv = File.open(people_file, "r")
      skills_file = "skills.csv"
      skills_csv = File.open(skills_file, "r")

      skills_set = {}
      skills_csv.each_with_index{|line, number|
        next if number.zero?
        fields = line.chomp.split(";")
        skills_set[fields[0]] ||= {}
        skills_set[fields[0]][fields[2]] ||= []
        skills_set[fields[0]][fields[2]] << fields[1]
      }

      people_csv.each_with_index {|line, number|
        next if number.zero?
        fields = line.chomp.split(";")
        person = Person.new(fields[0], fields[1], fields[2])
        skills_set[person.id].each{|role_name, skills|
          role = Role.new(role_name)
          role.skills = skills
          person.roles << role
        }
        @people << person
      }

    end

    def person_by_name(name)
      @people.select{|person| person.name = name.downcase}.first
    end

    def list_skills(name: "", role: "")
      person = person_by_name(name)
      person
      #TODO filter by role
    end

    def list_people(role: "", skill: "")
      #TODO filter by role, skill
    end
  end
end

app = App::SkillUtil.new
app.load
puts app.list_skills(name: "Fulano").inspect
