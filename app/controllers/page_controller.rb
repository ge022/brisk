class PageController < ApplicationController



  def home
  end

  def restaurants
    @restaurants = {
        "Seattle": '*****',
        "Chicago": '****',
        "Honolulu": '***',
        "Orlando": '****'
    }
  end

  def blog
  end

  def articles
  end

  def calendar
    @month = params['month'].to_i
    @month = Time.now.month if @month == 0

    @year = params['year'].to_i
    @year = Time.now.year if @year == 0
  end

  def contact_us

    @products = Product.all.map { |product| product.name }
    @selected_product = params[:product]

    @name = params['name']
    @email = params['email']

    @phone = params['phone']
    @question = params['question']
    @to = params['to']

    @newsletter = params['newsletter']
    @notifications = params['notifications']

    # Validation
    @valid = true

    if params['commit'] == 'Submit'

      if @name.empty?
        @valid = false
        flash.now['name_error'] = 'Name is required.'
      end
      if @email.empty?
        @valid = false
        flash.now['email_error'] = 'Email is required.'
      end
      if @question.empty?
        @valid = false
        flash.now['question_error'] = 'We need to know your question!'
      end

      if @valid

        # Send email to admin
        UserMailer.contact_email(@email, @name, @question, @phone, @to, @newsletter, @notifications, @selected_product).deliver_now

        # Send thank you email

        # UserMailer.contact_email(@email).deliver_now

        flash.now['success'] = 'Email sent!'

      end

    end

  end

  def login
  end

  def preferences

  end

end
