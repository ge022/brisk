module ApplicationHelper

  def nav_link_to text, path
    return link_to text, path,
                   if content_for(:page) == text
                     {class: 'active'}
                   end
  end

  def calendar(monthToDisplay, yearToDisplay)
    date = Date.new(yearToDisplay, monthToDisplay)
    first_day = date.at_beginning_of_month.wday
    last_day = date.at_end_of_month
    days_in_month = Time.days_in_month(monthToDisplay, yearToDisplay)

    prev_year = yearToDisplay
    next_year = yearToDisplay

    prev_month = monthToDisplay - 1
    if prev_month == 0
      prev_month = 12
      prev_year = yearToDisplay - 1
    end

    next_month = monthToDisplay + 1
    if next_month == 13
      next_month = 1
      next_year = yearToDisplay + 1
    end

    days_in_prev_month = Time.days_in_month(prev_month, prev_year)

    cal_str = ''
    cal_str += '<table class="calendar-table">
                <thead>
                <tr>
                <td class="previous">'
    cal_str += link_to '<', calendar_path(month: prev_month, year: prev_year), title: 'Previous month'
    cal_str += '</td>
                <td colspan="5" class="calendar-title">
                <h3>'
    cal_str += date.strftime("%B %Y")
    cal_str += '</h3>
                </td>
                <td class="next">'
    cal_str += link_to '>', calendar_path(month: next_month, year: next_year), title: 'Next month'
    cal_str += '</td>
                </tr>
                <tr>
                  <th scope="col" title="Sunday">Sun</th>
                  <th scope="col" title="Monday">Mon</th>
                  <th scope="col" title="Tuesday">Tue</th>
                  <th scope="col" title="Wednesday">Wed</th>
                  <th scope="col" title="Thursday">Thu</th>
                  <th scope="col" title="Friday">Fri</th>
                  <th scope="col" title="Saturday">Sat</th>
                </tr>
              </thead>

              <tbody>
              <tr>'

    # Output last month's last days until first_day
    first_day.times do
      cal_str += '<td class="day-disabled">'
      cal_str += (days_in_prev_month - first_day + 1).to_s
      cal_str += '</td>'
      days_in_prev_month += 1
    end

    # Output the rest of the first week's days
    current_day = 1
    (7 - first_day).times do
      cal_str += '<td class="day">'
      cal_str += (current_day).to_s
      cal_str += '</td>'
      current_day += 1
    end

    cal_str += '</tr>'

    # Output the full weeks
    days_left = days_in_month - current_day
    whole_weeks = (days_left / 7).to_i
    whole_weeks.times do
      cal_str += '<tr>'
      7.times do
        cal_str += '<td class="day">'
        cal_str += current_day.to_s
        cal_str += '</td>'
        current_day += 1
      end
      cal_str += '</tr>'
    end

    # Output the last week
    cal_str += '<tr>'
    (days_in_month - current_day + 1).times do
      cal_str += '<td class="day">'
      cal_str += current_day.to_s
      cal_str += '</td>'
      current_day += 1
    end

    # Output the next month's first days until end of week
    day = 1
    (6 - last_day.wday).times do
      cal_str += '<td class="day-disabled">'
      cal_str += day.to_s
      cal_str += '</td>'
      day += 1
    end
    cal_str += '</tr>'

    cal_str += '</tbody>
                </table>'

    return cal_str.html_safe

  end
end