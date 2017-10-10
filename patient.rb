class MedTypeError < StandardError
  # def message
  #   puts "Medications Are Not Valid"
  # end
end

class Patient
  attr_accessor :first_name, :last_name, :status, :current_balance, :med_list,:patient_contact_info

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @med_list = []
  end

  def patient_status(status)
    raise ArgumentError,"Argument is not a string" unless status.is_a? String
    @status = status
    puts "Status: #{@status}"
  end
  def patient_contact_info
    puts "First Name: #{@first_name}. Last Name: #{@last_name}"
  end
  def patient_currently_admitted?(admit_time)
    puts "Patient currently in hospital, admitted at #{admit_time}"
  end

  def patient_new_total(amount)
    @current_balance = 0
    puts "Current balance before calculation: $#{current_balance}"
    raise ArgumentError, "Error: Amount entered was 0" unless amount != 0
    # @current_balance = (current_balance + amount)/current_balance

    # This runs only if there are no exceptions
  rescue ArgumentError=>e
    puts e.message
  else
    @current_balance = amount
    puts "Current balance after calculation: $#{current_balance}"
  end

  def add_med_to_list(med, dosage)

      raise ArgumentError,"#{med} is not a string" unless med.is_a? String

      raise ArgumentError,"#{dosage} is not a integer" unless dosage.is_a? Integer

      puts "Medication added: #{med}"
      @med_list.push([med,dosage])

    #Create a new class called MedTypeError that inherits from StandardError and use that as seen below:
    begin
      raise MedTypeError, "This is not a valid medication" #unless @med_list!=nil
    rescue MedTypeError =>e
      @med_list.each {|v|puts "#{v[0]}: #{v[1]}mgs"}
      puts e.message
    end
  end

  def patient_medications_list
    puts "User medication list:"
    begin
      raise RuntimeError, "Medications list is not valid!" #unless @med_list!=nil
    rescue RuntimeError=>e
      puts e.message
    else
      puts @med_list
    ensure
    # This needs to run whether there was an exception or not.
    puts "Disclaimer: The hospital is not responsible for the user's health due to medications they may be using."
  end
end
end
