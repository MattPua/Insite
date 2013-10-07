# == Adding your own datetime formats to to_formatted_s
# DateTime formats are shared with Time. You can add your own to the
# Time::DATE_FORMATS hash. Use the format name as the hash key and
# either a strftime string or Proc instance that takes a time or
# datetime argument as the value.

Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:date] = '%B %d, %Y @ %I:%M%p'