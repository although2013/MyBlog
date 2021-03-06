module ApplicationHelper
  def week_day(from_time)
    case from_time.strftime('%A')
    when 'Monday'    then "周一"
    when 'Tuesday'   then "周二"
    when 'Wednesday' then "周三"
    when 'Thursday'  then "周四"
    when 'Friday'    then "周五"
    when 'Saturday'  then "周六"
    when 'Sunday'    then "周日"
    else                  "    "
    end
  end

  def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = (((to_time - from_time).abs)/60).round
    distance_in_seconds = ((to_time - from_time).abs).round


    case distance_in_minutes
        when 0..1
            return (distance_in_minutes == 0) ? '不到1分钟' : '1分钟' unless include_seconds

        case distance_in_seconds
            when 0..4   then '5秒'
            when 5..9   then '10秒'
            when 10..19 then '20秒'
            when 20..39 then '半分钟'
            when 40..59 then '不到1分钟'
            else             '1分钟'
        end
 
        when 2..44           then "#{distance_in_minutes}分钟"
        when 45..89          then '1小时'
        when 90..1439        then "#{(distance_in_minutes.to_f / 60.0).round}小时"
        when 1440..2879      then '1天'
        when 2880..20159     then "#{(distance_in_minutes / 1440).round}天"
        when 20160..1051199  then "#{from_time.strftime('%m月%d日 %H:%M')} #{week_day(from_time)}"

    else
        #"#{(distance_in_minutes / 525600).round}年"
        "#{from_time.strftime('%Y年%m月%d日 %H:%M')} #{week_day(from_time)}"
   end
  end


  def login?
    !!current_user
  end

  def login_required
    unless login?
      redirect_to login_path
    end
  end

end
