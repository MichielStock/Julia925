now = time()
seconds = now % 60 # 60 seconds in a minute
now -= seconds
# to minutes
now = div(now, 60) 
minutes = now % 60 # 60 minutes in an hour
now -= minutes
# to hours
now = div(now, 60)
hours = now % 24 # 24 hours in a day
now -= hours
# to days
now = div(now, 24)
days = now % 365 # ± 365 days in a year