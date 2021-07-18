class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.filter { |appointment| appointment.patient == self }
    end
    
    def doctors
        self.appointments.map { |appointment| appointment.doctor }.uniq
    end

    def self.all
        @@all
    end
end