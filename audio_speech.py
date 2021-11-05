import speech_recognition as sr
import pyaudio

pa = pyaudio.PyAudio()
print(pa.get_default_input_device_info())

r = sr.Recognizer()

with sr.Microphone() as source:
    print("Say Something...")
    r.adjust_for_ambient_noise(source)
    audio = r.listen(source)

    try:
        text = r.recognize_google(audio, language='pt-BR')
        print("What did you say: {}".format(text))
    except:
        print("I am sorry! I can not understand!")