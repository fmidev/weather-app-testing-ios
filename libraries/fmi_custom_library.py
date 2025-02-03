from datetime import datetime, timedelta


""" This function returns next full hour in given format (optional). Default format is %H.%M """


def get_next_full_hour(time_format = "%H.%M"):
    now = datetime.now()
    next_hour_date = now.replace(microsecond=0, second=0, minute=0) + timedelta(hours=1)
    return next_hour_date.strftime(time_format)


""" This function returns True or False if given key exists in given dictionary. """


def get_status_is_key_found_in_dictionary(dictionary, key):
    return key in dictionary
