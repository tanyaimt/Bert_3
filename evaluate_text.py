#!/usr/bin/python
import trainned_test as tt
import tensorflow as tf
from official.nlp.bert.tokenization import FullTokenizer
import numpy as np
from googletrans import Translator
from pprint import pprint
#import mysql_conn as db

#Entrada de contexto
my_context_esp = "Estoy interesado en un punto de venta donde me indique que me apoye el inventario para hacerlo fácil y rápido me manejé un sistema de stock donde yo pueda donde el mismo programa me maneje a alertas que me indiquen cuando un producto está por acabarse y pueda ingresar los sacar el precio del producto además necesito que ese sistema maneje este la información tanto de mis clientes como de mis proveedores su información como dirección nombre y rfc de los de los proveedores y el la un listado de los productos que maneja y este también me gustaría en el parte de parte de los clientes manejar la información del nombre número de cliente y este y veces que Juan cada cuando compra y también que me maneje estadísticas de venta por día estoy interesado en un punto estoy interesado en un punto de venta así por el estilo"
#Pregunta
my_question_esp = "Que queremos hacer facil y rapido"

translator = Translator()

my_context =  str(translator.translate(my_context_esp, dest="en").text)
my_question =  str(translator.translate(my_question_esp, dest="en").text)

my_input_dict, my_context_words, context_tok_to_word_id, question_tok_len = tt.create_input_dict(my_question, my_context)

start_logits, end_logits = tt.bert_squad(my_input_dict, training=False)

start_logits_context = start_logits.numpy()[0, question_tok_len+1:]
end_logits_context = end_logits.numpy()[0, question_tok_len+1:]

start_word_id = context_tok_to_word_id[np.argmax(start_logits_context)]
end_word_id = context_tok_to_word_id[np.argmax(end_logits_context)]

pair_scores = np.ones((len(start_logits_context), len(end_logits_context)))*(-1E10)
for i in range(len(start_logits_context-1)):
    for j in range(i, len(end_logits_context)):
        pair_scores[i, j] = start_logits_context[i] + end_logits_context[j]
pair_scores_argmax = np.argmax(pair_scores)

start_word_id = context_tok_to_word_id[pair_scores_argmax // len(start_logits_context)]
end_word_id = context_tok_to_word_id[pair_scores_argmax % len(end_logits_context)]

predicted_answer = ' '.join(my_context_words[start_word_id:end_word_id+1])
print("\nThe answer to:\n" + my_question + "\nis:\n" + predicted_answer)
predicted_answer_esp = str(translator.translate(predicted_answer, dest="es").text)
print("\nRespuesta a:\n" + my_question_esp + "\nis:\n" + predicted_answer_esp)

#print(tt.tokenize_context(predicted_answer_esp))
tokenizer = FullTokenizer(vocab_file, do_lower_case)

#question_tok = tokenizer.tokenize(my_question)
#mydb=db.connection_to_db()

# print(mydb)

# mycursor = mydb.cursor()
# mycursor.execute("SELECT * FROM bd_tabla")
# myresult = mycursor.fetchall()
# for x in myresult:
#   print(x)
