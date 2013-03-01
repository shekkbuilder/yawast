def iis_check_banner(banner)
  #don't bother if this doesn't include IIS
  return if !banner.include? 'Microsoft-IIS/'

  puts_warn "IIS Version: #{banner}"
  puts ''
end