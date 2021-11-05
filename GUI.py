import requests
import tkinter as tk
HEIGHT=350
WIDTH=400

# mydb = mysql.connector.connect(host="localhost",user="root",passwd="",database="pythonTEST1")

import speech_recognition as sr

r = sr.Recognizer()

def capturavoz():
    speech = sr.Microphone(device_index=0)
    # for speech recognition
    with speech as source:
        label3['text'] = "say something!…"
        audio = r.adjust_for_ambient_noise(source)
        audio = r.record(source,duration=3,offset=4.7)
    # recognize speech using Sphinx
    try:
        recog = r.recognize_sphinx(audio)  
        label4['text'] ="Sphinx thinks you said '" + recog + "'"
    except sr.UnknownValueError:  
        label4['text'] ="Sphinx could not understand audio"
    except sr.RequestError as e:  
        label4['text'] ="Sphinx error; {0}".format(e)


#GUI
root=tk.Tk()
text_from_mic=""

canvas=tk.Canvas(root,height=HEIGHT,width=WIDTH)
canvas.pack()

frame1=tk.Frame(root,bg='#e6e6e6')
frame1.place(relwidth=0.9,relheight=0.3,relx=0.05,rely=0.05)

label1=tk.Label(frame1,text="Projecto ISC Tanya Rojas",bg="#e6e6e6",font=60,anchor="e")
label1.grid(row=1,column=1)

label6=tk.Label(frame1,text="MAESTRIA EN CIENCIAS DE LA INGENIERA",bg="#e6e6e6",font=60,anchor="e")
label6.grid(row=2,column=1)

label2=tk.Label(frame1,text="Sistema de control por voz a traves\n del procesamiento del lenguaje natural \ncomo modelo interactivo para plataformas\n escalables ERP en la industria 4.0\n",bg="#e6e6e6",font=60,anchor="e")
label2.grid(row=6,column=1)

frame2=tk.Frame(root,bg='#e6e6e6')
frame2.place(relwidth=0.9,relheight=0.5,relx=0.05,rely=0.4)

label3=tk.Label(frame2,text="Nombre (s)",bg="#e6e6e6",width=10,anchor="e")
label3.grid(row=0,column=1)

entry1=tk.Entry(frame2,bg='#ffffff',width=42)
entry1.grid(row=6,column=1)

button5 = tk.Button(frame2, text="Solicitar", font=40,width=35, command=lambda: capturavoz())
button5.grid(row=10,column=1)

label4=tk.Label(frame1,text=text_from_mic,bg="#e6e6e6",font=60,anchor="e")
label4.grid(row=1,column=1)

root.mainloop()