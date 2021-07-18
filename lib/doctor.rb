class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.filter { |appointment| appointment.doctor == self }
    end

    def patients
        self.appointments.map { |appointment| appointment.patient }.uniq
    end

    def self.all
        @@all
    end
end