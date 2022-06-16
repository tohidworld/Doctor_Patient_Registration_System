from calendar import calendar
from googleapiclient.discovery import build
import pickle
from datetime import datetime, timedelta


def create_event(credentials,start_time,date,calendarId,required_speciality):
    y = int(str(date).split('-')[0])
    mo = int(str(date).split('-')[1])
    dt = int(str(date).split('-')[2])
    h = int(str(start_time).split(':')[0])
    m= int(str(start_time).split(':')[1])
    s = int(str(start_time).split(':')[2])
    start_time = datetime(y,mo,dt,h,m,s)
    end_time = start_time +timedelta(minutes=45)
    end_time_m = datetime.strptime(str(end_time).split(" ")[1],'%H:%M:%S').time()
    
    credentials = pickle.load(open("appointment\credentials\\"+credentials,'rb'))
    service = build("calendar", "v3", credentials=credentials)
    event = {
        'summary': required_speciality,
        'start': {
            'dateTime': start_time.strftime("%Y-%m-%dT%H:%M:%S"),
            'timeZone': 'Asia/Kolkata',
        },
        'end' : {
            'dateTime': end_time.strftime("%Y-%m-%dT%H:%M:%S"),
            'timeZone': 'Asia/Kolkata',
        }

    
    }
    created_calendar = service.events().insert(calendarId=calendarId,body=event).execute()

    print(created_calendar['id'])
    return end_time_m, created_calendar['id']


