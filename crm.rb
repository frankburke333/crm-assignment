require_relative 'contact'

class CRM
  #we initialize requiring a name for the new CRM. main menu will guide the user.
  def initialize
    main_menu
  end
  # this method will print the menu to the screen, the user input and then call
  # on the method needed with the call_option method
  def main_menu
    while true
      print_main_menu
      user_selected =gets.to_i
      call_option(user_selected)
    end
  end

  #this method displays the menu choices
  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end
  #this menu calls on the method needed to complete the users primary chosen action
  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  #
  def add_new_contact
    print "Enter First Name:"
    first_name = gets.chomp

    print "Enter Last Name:"
    last_name = gets.chomp

    print "Enter Email Address:"
    email = gets.chomp

    print "Enter Note:"
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)


  end

  def attribute_list
    puts 'Please select the attribute'
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'

  end

  #this method was built to avoid mistakes by asking for the contact unique ID
  #makes use of the find_id contact method
  def modify_existing_contact
    display_all_contacts
    puts "Choose the ID you would like to modify"
    id = gets.chomp.to_i
    modify_contact = Contact.find(id)

    attribute_list

    while user_selected =gets.to_i

    case user_selected
    when 1 then puts "Enter New First Name"
      new = modify_contact.update(:first_name, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 2 then puts "Enter New Last Name"
      new = modify_contact.update(:last_name, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 3 then puts "Enter New Email Address"
      new = modify_contact.update(:email, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

    when 4 then puts "Enter New Note"
      new =modify_contact.update(:note, value = gets.chomp)
      puts
      modify_contact.display_contact
      puts
      break

      else
        puts "======================================="
        puts "please enter a number between 1 and 4"
        puts "======================================="
        attribute_list
      end
    end
    end



  #also using ID here to avoid mistakes.
  #using find_id method
  def delete_contact
    display_all_contacts
    puts "which ID would you like to delete?"
    id = gets.chomp.to_i
    delete_value = Contact.find(id)
    delete_value.delete
  end


  #makes use of the Contact.all method
  def display_all_contacts
    all_contact = Contact.all
    all_contact.each do |list|
      puts:"==============================="
      puts "first name: #{list.first_name}"
      puts "last name: #{list.last_name}"
      puts "email: #{list.email}"
      puts "note: #{list.note}"
      puts "id: #{list.id}"
      puts

    end
  end

  #keeping with the list style numbered choices to avoid mistakes.
  #makes use of Contact.find_by and display_contact method

  def search_by_attribute
    attribute_list
    puts " Choose number for Search attribute"
    while user_selected =gets.to_i


    case user_selected
    when 1 then puts "Enter First Name"
      search_result = Contact.find_by(:first_name, value = gets.chomp.to_s)
      puts
      search_result.display_contact
      puts
      break

    when 2 then puts "Enter Last Name"
      search_result = Contact.find_by(:last_name, value = gets.chomp.to_s)
      puts
      search_result.display_contact
      puts
      break

    when 3 then puts "Enter Email Address"
      search_result = Contact.find_by(:email, value = gets.chomp)
      puts
      search_result.display_contact
      puts
      break

    when 4 then puts "Enter Note"
      search_result = Contact.find_by(:note, value = gets.chomp)
      puts
      search_result.display_contact
      puts
      break

      else
        puts "---------------------------------------"
        puts "please enter a number between 1 and 4"
        puts "======================================="
        attribute_list

      end
      end
    end
  end



  new_crm = CRM.new
