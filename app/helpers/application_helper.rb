module ApplicationHelper
	def date_format(date)
		Russian::strftime(date, '%d %B %Y')
	end

  def date_format_time(date)
    Russian::strftime(date, '%d %B %Y %H:%M')
  end

	def task_count(count)
    if count == 1
      return 'заказ'
    end
    if count == 2 || count == 3 || count == 4
      return 'заказа'
    end
    if count >= 5 || count == 0
      return 'заказов'
    end
  end

  def order_count(count)
    if count == 1
      return 'заявка'
    end
    if count == 2 || count == 3 || count == 4
      return 'заявки'
    end
    if count >= 5 || count == 0
      return 'заявок'
    end
  end
end
