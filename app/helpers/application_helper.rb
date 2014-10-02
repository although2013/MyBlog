module ApplicationHelper
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
        when 2880..43199     then "#{(distance_in_minutes / 1440).round}天"
        when 43200..86399    then '1个月'
        when 86400..525599   then "#{(distance_in_minutes / 43200).round}个月"
        when 525600..1051199 then '1年'
    else                      "#{(distance_in_minutes / 525600).round}年"
   end
  end
end
