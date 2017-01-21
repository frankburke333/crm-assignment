class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []

  @@next_id = 333




  def first_name
    @first_name
  end

  def first_name=(update)
    @first_name = update
  end


  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@next_id +=1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)

    new_contact = self.new(first_name, last_name, email, note)

    @@contacts << new_contact

    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      return contact if contact.id == id
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  #$frank.update(:first_name, "John")
  def update(attribute, new_value)

    case attribute
    when :first_name
      self.first_name = new_value
    when :last_name
      self.last_name = new_value
    when :email
      self.email = new_value
    when :note
      self.note = new_value

    end

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by (attribute, value)
    @@contacts.each do |contact|
    return contact if attribute == :first_name && contact.first_name == value
    return contact if attribute == :last_name && contact.last_name == value
    return contact if attribute == :email&& contact.email == value
    return contact if attribute == :note && contact.note == value

    end

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
