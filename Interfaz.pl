:- use_module(library(pce)).
:- use_module(library(odbc)).
:- use_module(library(pce_util)).
:- pce_image_directory('./Images').

resource(imagen_p, image, image('fondo_p.jpg')).
resource(imgfi, image, image('pajarof.jpg')).

iniciar:-
    new(Presentacion, dialog('Sistema Experto Aves',size(200,200))),
    new(Titulo, text('Sistema Experto Para La Detecciòn De Aves')),
    send(Titulo, font, bold),
    send(Titulo, alignment,center),
    send(Titulo, colour, '#138D75'),
    send(Presentacion, append, Titulo),
    new(Nombre, text('Luis Gabriel')),
    send(Nombre, alignment, center),
    send(Nombre, colour, '#58D68D'),
    send(Presentacion, append, Nombre),

    new(N_1, text_item(nombre)),
    new(N_2, text_item(apelliods)),
    send(Presentacion, append, N_1),
    send(Presentacion, append, N_2),

    new(Boton_seguir, button('Comenzar', and(message(@prolog,buscar,N_1?selection,N_2?selection)))),
    new(Boton_info, button('Informacion', and(message(@prolog,informacion)))),
    send(Presentacion, append, Boton_seguir),
    send(Presentacion, append, Boton_info),
    nueva_imagen(Presentacion, imagen_p),
    send(Presentacion,open).

informacion :-
    new(Info, dialog('Tipos de Aves', size(500, 600))),

    % Título principal
    new(Titulo1, text('Bienvenido al Identificador de Aves')),
    send(Titulo1, font, bold),
    send(Titulo1, alignment, center),
    send(Titulo1, colour, '#0B5345'),

    % Texto descriptivo
    new(Resp1, text('Este sistema le ayudará a identificar el tipo de ave respondiendo una serie de preguntas relacionadas con sus características.')),
    send(Resp1, alignment, left),

    % Subtítulo y contenido sobre alimentación
    new(Titulo2, text('Alimentación')),
    send(Titulo2, font, bold),
    send(Titulo2, alignment, left),
    send(Titulo2, colour, '#0B5345'),

    new(Resp2, text('Las aves pueden alimentarse de néctar, carroña, peces u otros alimentos específicos que definen sus hábitos y hábitats.')),

    % Subtítulo y contenido sobre reproducción
    new(Titulo3, text('Reproducción')),
    send(Titulo3, font, bold),
    send(Titulo3, alignment, left),
    send(Titulo3, colour, '#0B5345'),

    new(Resp3, text('Muchas aves realizan rituales de cortejo y construyen nidos elaborados para asegurar el éxito reproductivo.')),

    % Subtítulo y contenido sobre migración
    new(Titulo4, text('Migración')),
    send(Titulo4, font, bold),
    send(Titulo4, alignment, left),
    send(Titulo4, colour, '#0B5345'),

    new(Resp4, text('Algunas aves realizan migraciones anuales, a veces atravesando continentes enteros, para aprovechar diferentes climas y recursos.')),

    % Subtítulo y contenido sobre polinización y control de plagas
    new(Titulo5, text('Interacciones ecológicas')),
    send(Titulo5, font, bold),
    send(Titulo5, alignment, left),
    send(Titulo5, colour, '#0B5345'),

    new(Resp5, text('Ciertas aves polinizan flores específicas y otras controlan plagas cazando roedores en áreas agrícolas.')),

    % Subtítulo y contenido sobre dispersión y conservación
    new(Titulo6, text('Dispersión y Conservación')),
    send(Titulo6, font, bold),
    send(Titulo6, alignment, left),
    send(Titulo6, colour, '#0B5345'),

    new(Resp6, text('Muchas aves ayudan a dispersar semillas, mientras que algunas están amenazadas por la deforestación o la caza furtiva.')),


    % Subtítulo y contenido sobre taxonomía
    new(Titulo7, text('Taxonomía')),
    send(Titulo7, font, bold),
    send(Titulo7, alignment, left),
    send(Titulo7, colour, '#0B5345'),

    new(Resp7, text('Las aves se clasifican en distintos órdenes como Paseriformes, Falconiformes y también incluyen aves no voladoras como Rheiformes o Struthioniformes.')),

    % Subtítulo y contenido sobre anatomía y adaptaciones
    new(Titulo8, text('Anatomía y Adaptaciones')),
    send(Titulo8, font, bold),
    send(Titulo8, alignment, left),
    send(Titulo8, colour, '#0B5345'),

    new(Resp8, text('Las aves tienen plumas para vuelo y aislamiento térmico, picos especializados y adaptaciones en las alas para volar, planear o nadar.')),

    % Subtítulo y contenido sobre hábitat
    new(Titulo9, text('Hábitat')),
    send(Titulo9, font, bold),
    send(Titulo9, alignment, left),
    send(Titulo9, colour, '#0B5345'),

    new(Resp9, text('Las aves habitan una amplia variedad de ecosistemas, desde selvas tropicales y desiertos, hasta océanos, costas y zonas urbanas.')),

    % Botón para cerrar
    new(Cerrar, button('Cerrar', message(Info, destroy))),

    % Añadir componentes al diálogo
    send(Info, append, Titulo1),
    send(Info, append, Resp1),

    send(Info, append, Titulo2),
    send(Info, append, Resp2),

    send(Info, append, Titulo3),
    send(Info, append, Resp3),

    send(Info, append, Titulo4),
    send(Info, append, Resp4),

    send(Info, append, Titulo5),
    send(Info, append, Resp5),

    send(Info, append, Titulo6),
    send(Info, append, Resp6),

    send(Info, append, Titulo7),
    send(Info, append, Resp7),

    send(Info, append, Titulo8),
    send(Info, append, Resp8),

    send(Info, append, Titulo9),
    send(Info, append, Resp9),

    send(Info, append, Cerrar),

    % Mostrar la ventana
    send(Info, open).


nueva_imagen(Ventana, Imagen) :-
    new(Figura, figure),
    new(Bitmap, bitmap(resource(Imagen), @on)),
    send(Bitmap, name, 1),
    send(Figura, display, Bitmap),
    send(Figura, status, 1),
    send(Figura, alignment, center),
    send(Ventana, append, Figura).


buscar(NombreStr, ApellidoStr):-
    new(Principal, dialog('Sistema Experto Aves')),
    new(Titulo, text('Sistemas experto')),
    send(Titulo, font, bold),
    send(Titulo, alignment, center),
    send(Titulo, colour, '#17A589'),
    send(Principal, append, Titulo),

    % ----------------------------
    % PREGUNTAS SOBRE ALIMENTACIÓN
    % ----------------------------
    new(Pregunta_1, text('1.¿El ave se alimenta de néctar?')),
    send(Pregunta_1, alignment, left),

    new(Pregunta_2, text('2.¿El ave consume carroña regularmente?')),
    send(Pregunta_2, alignment, left),

    new(Pregunta_3, text('3.¿El ave tiene hábitos de pesca?')),
    send(Pregunta_3, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE REPRODUCCIÓN
    % ----------------------------
    new(Pregunta_4, text('4.¿El ave realiza rituales de cortejo?')),
    send(Pregunta_4, alignment, left),

    new(Pregunta_5, text('5.¿Construye nidos para reproducirse?')),
    send(Pregunta_5, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE MIGRACIÓN
    % ----------------------------
    new(Pregunta_6, text('6.¿Migra de Europa a África cada año?')),
    send(Pregunta_6, alignment, left),

    new(Pregunta_7, text('7.¿Realiza migraciones largas (más de 70,000 km)?')),
    send(Pregunta_7, alignment, left),

    % ----------------------------
    % PREGUNTA SOBRE POLINIZACIÓN
    % ----------------------------
    new(Pregunta_8, text('8.¿Poliniza flores tubulares?')),
    send(Pregunta_8, alignment, left),

    % ----------------------------
    % PREGUNTA SOBRE CONTROL DE PLAGAS
    % ----------------------------
    new(Pregunta_9, text('9.¿Caza roedores en zonas agrícolas?')),
    send(Pregunta_9, alignment, left),

    % ----------------------------
    % PREGUNTA SOBRE DISPERSIÓN DE SEMILLAS
    % ----------------------------
    new(Pregunta_10, text('10.¿Ayuda a dispersar semillas?')),
    send(Pregunta_10, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE CONSERVACIÓN
    % ----------------------------
    new(Pregunta_11, text('11.¿Está amenazada por la deforestación?')),
    send(Pregunta_11, alignment, left),

    new(Pregunta_12, text('12.¿Fue víctima de la caza furtiva?')),
    send(Pregunta_12, alignment, left),

    new(Pregunta_13, text('13.¿Su población aumentó significativamente en los últimos años?')),
    send(Pregunta_13, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE TAXONOMÍA
    % ----------------------------
    new(Pregunta_14, text('14.¿Pertenece al orden de los Paseriformes?')),
    send(Pregunta_14, alignment, left),

    new(Pregunta_15, text('15.¿Pertenece al orden de los Falconiformes?')),
    send(Pregunta_15, alignment, left),

    new(Pregunta_16, text('16.¿Es un ave no voladora como los Rheiformes o Struthioniformes?')),
    send(Pregunta_16, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE ANATOMÍA Y ADAPTACIONES
    % ----------------------------
    new(Pregunta_17, text('17.¿Tiene plumas para vuelo y aislamiento térmico?')),
    send(Pregunta_17, alignment, left),

    new(Pregunta_18, text('18.¿Tiene un pico especializado (filtrador, granívoro, carnívoro)?')),
    send(Pregunta_18, alignment, left),

    new(Pregunta_19, text('19.¿Sus alas están adaptadas para planear o maniobrar?')),
    send(Pregunta_19, alignment, left),

    new(Pregunta_20, text('20.¿Sus alas no son funcionales para volar, sino para nadar?')),
    send(Pregunta_20, alignment, left),

    new(Pregunta_21, text('21.¿Tiene sacos aéreos para volar a gran altitud?')),
    send(Pregunta_21, alignment, left),

    % ----------------------------
    % PREGUNTAS SOBRE HÁBITAT
    % ----------------------------
    new(Pregunta_22, text('22.¿Vive en selvas tropicales?')),
    send(Pregunta_22, alignment, left),

    new(Pregunta_23, text('23.¿Habita en zonas desérticas?')),
    send(Pregunta_23, alignment, left),

    new(Pregunta_24, text('24.¿Habita en océanos o costas?')),
    send(Pregunta_24, alignment, left),

    new(Pregunta_25, text('25.¿Se encuentra en zonas urbanas?')),
    send(Pregunta_25, alignment, left),


    new(R_1, menu('', cycle)),
    new(R_2, menu('', cycle)),
    new(R_3, menu('', cycle)),
    new(R_4, menu('', cycle)),
    new(R_5, menu('', cycle)),
    new(R_6, menu('', cycle)),
    new(R_7, menu('', cycle)),
    new(R_8, menu('', cycle)),
    new(R_9, menu('', cycle)),
    new(R_10, menu('', cycle)),
    new(R_11, menu('', cycle)),
    new(R_12, menu('', cycle)),
    new(R_13, menu('', cycle)),
    new(R_14, menu('', cycle)),
    new(R_15, menu('', cycle)),
    new(R_16, menu('', cycle)),
    new(R_17, menu('', cycle)),
    new(R_18, menu('', cycle)),
    new(R_19, menu('', cycle)),
    new(R_20, menu('', cycle)),
    new(R_21, menu('', cycle)),
    new(R_22, menu('', cycle)),
    new(R_23, menu('', cycle)),
    new(R_24, menu('', cycle)),
    new(R_25, menu('', cycle)),

    Respuestas_validas = ['NO','SI'],

    send_list(R_1, append, Respuestas_validas),
    send_list(R_2, append, Respuestas_validas),
    send_list(R_3, append, Respuestas_validas),
    send_list(R_4, append, Respuestas_validas),
    send_list(R_5, append, Respuestas_validas),
    send_list(R_6, append, Respuestas_validas),
    send_list(R_7, append, Respuestas_validas),
    send_list(R_8, append, Respuestas_validas),
    send_list(R_9, append, Respuestas_validas),
    send_list(R_10, append, Respuestas_validas),
    send_list(R_11, append, Respuestas_validas),
    send_list(R_12, append, Respuestas_validas),
    send_list(R_13, append, Respuestas_validas),
    send_list(R_14, append, Respuestas_validas),
    send_list(R_15, append, Respuestas_validas),
    send_list(R_16, append, Respuestas_validas),
    send_list(R_17, append, Respuestas_validas),
    send_list(R_18, append, Respuestas_validas),
    send_list(R_19, append, Respuestas_validas),
    send_list(R_20, append, Respuestas_validas),
    send_list(R_21, append, Respuestas_validas),
    send_list(R_22, append, Respuestas_validas),
    send_list(R_23, append, Respuestas_validas),
    send_list(R_24, append, Respuestas_validas),
    send_list(R_25, append, Respuestas_validas),

    new(Grupo_de_Preguntas1, dialog_group(texts,group)),
    send(Grupo_de_Preguntas1, gap, size(0,20)),
    send(Grupo_de_Preguntas1, append, Pregunta_1),
    send(Grupo_de_Preguntas1, append, Pregunta_2),
    send(Grupo_de_Preguntas1, append, Pregunta_3),
    send(Grupo_de_Preguntas1, append, Pregunta_4),
    send(Grupo_de_Preguntas1, append, Pregunta_5),
    send(Grupo_de_Preguntas1, append, Pregunta_6),
    send(Grupo_de_Preguntas1, append, Pregunta_7),
    send(Grupo_de_Preguntas1, append, Pregunta_8),
    send(Grupo_de_Preguntas1, append, Pregunta_9),
    send(Grupo_de_Preguntas1, append, Pregunta_10),
    send(Grupo_de_Preguntas1, append, Pregunta_11),
    send(Grupo_de_Preguntas1, append, Pregunta_12),

    new(Grupo_de_Respuestas1, dialog_group(menus,group)),
    send(Grupo_de_Respuestas1, gap, size(0,11)),
    send(Grupo_de_Respuestas1, append, R_1),
    send(Grupo_de_Respuestas1, append, R_2),
    send(Grupo_de_Respuestas1, append, R_3),
    send(Grupo_de_Respuestas1, append, R_4),
    send(Grupo_de_Respuestas1, append, R_5),
    send(Grupo_de_Respuestas1, append, R_6),
    send(Grupo_de_Respuestas1, append, R_7),
    send(Grupo_de_Respuestas1, append, R_8),
    send(Grupo_de_Respuestas1, append, R_9),
    send(Grupo_de_Respuestas1, append, R_10),
    send(Grupo_de_Respuestas1, append, R_11),
    send(Grupo_de_Respuestas1, append, R_12),

    new(Grupo_de_Preguntas2, dialog_group(texts,group)),
    send(Grupo_de_Preguntas2, gap, size(0,20)),
    send(Grupo_de_Preguntas2, append, Pregunta_13),
    send(Grupo_de_Preguntas2, append, Pregunta_14),
    send(Grupo_de_Preguntas2, append, Pregunta_15),
    send(Grupo_de_Preguntas2, append, Pregunta_16),
    send(Grupo_de_Preguntas2, append, Pregunta_17),
    send(Grupo_de_Preguntas2, append, Pregunta_18),
    send(Grupo_de_Preguntas2, append, Pregunta_19),
    send(Grupo_de_Preguntas2, append, Pregunta_20),
    send(Grupo_de_Preguntas2, append, Pregunta_21),
    send(Grupo_de_Preguntas2, append, Pregunta_22),
    send(Grupo_de_Preguntas2, append, Pregunta_23),
    send(Grupo_de_Preguntas2, append, Pregunta_24),
    send(Grupo_de_Preguntas2, append, Pregunta_25),

    new(Grupo_de_Respuestas2, dialog_group(menus,group)),
    send(Grupo_de_Respuestas2, gap, size(0,13)),
    send(Grupo_de_Respuestas2, append, R_13),
    send(Grupo_de_Respuestas2, append, R_14),
    send(Grupo_de_Respuestas2, append, R_15),
    send(Grupo_de_Respuestas2, append, R_16),
    send(Grupo_de_Respuestas2, append, R_17),
    send(Grupo_de_Respuestas2, append, R_18),
    send(Grupo_de_Respuestas2, append, R_19),
    send(Grupo_de_Respuestas2, append, R_20),
    send(Grupo_de_Respuestas2, append, R_21),
    send(Grupo_de_Respuestas2, append, R_22),
    send(Grupo_de_Respuestas2, append, R_23),
    send(Grupo_de_Respuestas2, append, R_24),
    send(Grupo_de_Respuestas2, append, R_25),


    new(Fila1, dialog_group(fila1, group)),
    send(Fila1, append,Grupo_de_Preguntas1),
    send(Fila1, append, Grupo_de_Respuestas1, right),
    send(Principal, append, Fila1),

    new(Fila2, dialog_group(fila1, group)),
    send(Fila2, append, Grupo_de_Preguntas2),
    send(Fila2, append, Grupo_de_Respuestas2,right),
    send(Principal, append, Fila2, right),

    % Botón de evaluación
    new(Boton_Evaluar, button('Evaluar',
                              and(message(@prolog, evaluar,
                                          R_1?selection, R_2?selection, R_3?selection, R_4?selection, R_5?selection,
                                          R_6?selection, R_7?selection, R_8?selection, R_9?selection, R_10?selection,
                                          R_11?selection, R_12?selection, R_13?selection, R_14?selection, R_15?selection,
                                          R_16?selection, R_17?selection, R_18?selection, R_19?selection, R_20?selection,
                                          R_21?selection, R_22?selection, R_23?selection, R_24?selection, R_25?selection
                                         ))
                             )),

    send(Principal, append, Boton_Evaluar),
    atom_string(Nombre, NombreStr),
    atom_string(Apellido, ApellidoStr),
    ingresar_registro(Nombre, Apellido),

    % Mostrar ventana
    send(Principal, open).

evaluar(R_1, R_2, R_3, R_4, R_5, R_6, R_7, R_8, R_9, R_10,
        R_11, R_12, R_13, R_14, R_15, R_16, R_17, R_18,
        R_19, R_20, R_21, R_22, R_23, R_24, R_25) :-
    new(Respuesta, dialog('Resultado')),
    nueva_imagen(Respuesta, imgfi),

    get(R_1, value, Res_1),
    get(R_2, value, Res_2),
    get(R_3, value, Res_3),
    get(R_4, value, Res_4),
    get(R_5, value, Res_5),
    get(R_6, value, Res_6),
    get(R_7, value, Res_7),
    get(R_8, value, Res_8),
    get(R_9, value, Res_9),
    get(R_10, value, Res_10),
    get(R_11, value, Res_11),
    get(R_12, value, Res_12),
    get(R_13, value, Res_13),
    get(R_14, value, Res_14),
    get(R_15, value, Res_15),
    get(R_16, value, Res_16),
    get(R_17, value, Res_17),
    get(R_18, value, Res_18),
    get(R_19, value, Res_19),
    get(R_20, value, Res_20),
    get(R_21, value, Res_21),
    get(R_22, value, Res_22),
    get(R_23, value, Res_23),
    get(R_24, value, Res_24),
    get(R_25, value, Res_25),

    (
    colibri(Res_1, Res_4, Res_5, Res_8, Res_10, Res_11, Res_17, Res_18, Res_19, Res_21, Res_22, Res_25) ->
        Mensaje = 'Es un Colibrí';
    condor(Res_2, Res_4, Res_5, Res_11, Res_15, Res_17, Res_18, Res_19, Res_21, Res_22) ->
        Mensaje = 'Es un Cóndor';
    martin_pescador(Res_3, Res_4, Res_5, Res_11, Res_17, Res_18, Res_19, Res_21, Res_22, Res_24) ->
        Mensaje = 'Es un Martín Pescador';
    ave_del_paraiso(Res_1, Res_4, Res_5, Res_10, Res_11, Res_17, Res_18, Res_19, Res_22) ->
        Mensaje = 'Es un Ave del Paraíso';
    golondrina(Res_4, Res_5, Res_14, Res_17, Res_18, Res_19, Res_21, Res_22, Res_25) ->
        Mensaje = 'Es una Golondrina';
    charran_artico(Res_3, Res_4, Res_5, Res_7, Res_17, Res_18, Res_19, Res_21, Res_24) ->
        Mensaje = 'Es un Charrán Ártico';
    zorzal(Res_4, Res_5, Res_6, Res_10, Res_14, Res_17, Res_19, Res_25) ->
        Mensaje = 'Es un Zorzal';
    aguila(Res_4, Res_5, Res_11, Res_12, Res_15, Res_17, Res_18, Res_19, Res_21) ->
        Mensaje = 'Es un Águila';
    buho(Res_4, Res_5, Res_9, Res_11, Res_17, Res_18, Res_19, Res_21, Res_25) ->
        Mensaje = 'Es un Búho';
    kiwi(Res_4, Res_5, Res_11, Res_16, Res_17, Res_18) ->
        Mensaje = 'Es un Kiwi';
    pinguino(Res_3, Res_4, Res_5, Res_16, Res_17, Res_18, Res_20, Res_24) ->
        Mensaje = 'Es un Pingüino';
    condor_andino(Res_2, Res_4, Res_5, Res_11, Res_12, Res_15, Res_17, Res_18, Res_19, Res_21) ->
        Mensaje = 'Es un Cóndor Andino';
    avestruz(Res_4, Res_5, Res_12, Res_16, Res_17, Res_23) ->
        Mensaje = 'Es un Avestruz';
    flamenco(Res_4, Res_5, Res_17, Res_18, Res_24) ->
        Mensaje = 'Es un Flamenco';
    tucan(Res_4, Res_5, Res_8, Res_10, Res_11, Res_12, Res_17, Res_18, Res_19, Res_22) ->
        Mensaje = 'Es un Tucán';
    quetzal(Res_4, Res_5, Res_6, Res_10, Res_11, Res_12, Res_17, Res_18, Res_19, Res_22) ->
        Mensaje = 'Es un Quetzal';
    ganso(Res_4, Res_5, Res_6, Res_13, Res_17, Res_18, Res_19, Res_21, Res_25) ->
        Mensaje = 'Es un Ganso';
    carpintero(Res_4, Res_5, Res_10, Res_11, Res_17, Res_18, Res_19, Res_22, Res_25) ->
        Mensaje = 'Es un Pájaro Carpintero';
    cisne(Res_4, Res_5, Res_17, Res_18, Res_19, Res_25) ->
        Mensaje = 'Es un Cisne';
        Mensaje = 'No se pudo identificar el ave con la información proporcionada.'
    ),

    new(Titulo2, text('La Ave Puede Ser:')),
    send(Titulo2, font, bold),
    send(Titulo2, alignment, center),
    send(Titulo2, colour, '#17A589'),

    new(Salida, text(Mensaje)),
    send(Salida, font, bold),

    send(Respuesta, append, Titulo2),
    send(Respuesta, append, Salida),
    send(Respuesta, open).



% Ave 1: Colibrí
colibri(Res_1, Res_4, Res_5, Res_8, Res_10, Res_11, Res_17, Res_18, Res_19, Res_21, Res_22, Res_25) :-
    Res_1 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_8 == 'SI',
    Res_10 == 'SI',
    Res_11 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_22 == 'SI',
    Res_25 == 'SI'.

% Ave 2: Cóndor
condor(Res_2, Res_4, Res_5, Res_11, Res_15, Res_17, Res_18, Res_19, Res_21, Res_22) :-
    Res_2 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_11 == 'SI',
    Res_15 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_22 == 'SI'.

% Ave 3: Martín Pescador
martin_pescador(Res_3, Res_4, Res_5, Res_11, Res_17, Res_18, Res_19, Res_21, Res_22, Res_24) :-
    Res_3 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_11 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_22 == 'SI',
    Res_24 == 'SI'.

% Ave 4: Ave del Paraíso
ave_del_paraiso(Res_1, Res_4, Res_5, Res_10, Res_11, Res_17, Res_18, Res_19, Res_22) :-
    Res_1 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_10 == 'SI',
    Res_11 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_22 == 'SI'.

% Ave 5: Golondrina
golondrina(Res_4, Res_5, Res_14, Res_17, Res_18, Res_19, Res_21, Res_22, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_14 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_22 == 'SI',
    Res_25 == 'SI'.

% Ave 6: Charrán Ártico
charran_artico(Res_3, Res_4, Res_5, Res_7, Res_17, Res_18, Res_19, Res_21, Res_24) :-
    Res_3 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_7 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_24 == 'SI'.

% Ave 7: Zorzal
zorzal(Res_4, Res_5, Res_6, Res_10, Res_14, Res_17, Res_19, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_6 == 'SI',
    Res_10 == 'SI',
    Res_14 == 'SI',
    Res_17 == 'SI',
    Res_19 == 'SI',
    Res_25 == 'SI'.

% Ave 8: Águila
aguila(Res_4, Res_5, Res_11, Res_12, Res_15, Res_17, Res_18, Res_19, Res_21) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_11 == 'SI',
    Res_12 == 'SI',
    Res_15 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI'.

% Ave 9: Búho
buho(Res_4, Res_5, Res_9, Res_11, Res_17, Res_18, Res_19, Res_21, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_9 == 'SI',
    Res_11 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_25 == 'SI'.

% Ave 10: Kiwi
kiwi(Res_4, Res_5, Res_11, Res_16, Res_17, Res_18) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_11 == 'SI',
    Res_16 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI'.

% Ave 11: Pingüino
pinguino(Res_3, Res_4, Res_5, Res_16, Res_17, Res_18, Res_20, Res_24) :-
    Res_3 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_16 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_20 == 'SI',
    Res_24 == 'SI'.

% Ave 12: Cóndor Andino
condor_andino(Res_2, Res_4, Res_5, Res_11, Res_12, Res_15, Res_17, Res_18, Res_19, Res_21) :-
    Res_2 == 'SI',
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_11 == 'SI',
    Res_12 == 'SI',
    Res_15 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI'.

% Ave 13: Avestruz
avestruz(Res_4, Res_5, Res_12, Res_16, Res_17, Res_23) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_12 == 'SI',
    Res_16 == 'SI',
    Res_17 == 'SI',
    Res_23 == 'SI'.

% Ave 14: Flamenco
flamenco(Res_4, Res_5, Res_17, Res_18, Res_24) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_24 == 'SI'.

% Ave 15: Tucán
tucan(Res_4, Res_5, Res_8, Res_10, Res_11, Res_12, Res_17, Res_18, Res_19, Res_22) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_8 == 'SI',
    Res_10 == 'SI',
    Res_11 == 'SI',
    Res_12 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_22 == 'SI'.

% Ave 16: Quetzal
quetzal(Res_4, Res_5, Res_6, Res_10, Res_11, Res_12, Res_17, Res_18, Res_19, Res_22) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_6 == 'SI',
    Res_10 == 'SI',
    Res_11 == 'SI',
    Res_12 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_22 == 'SI'.

% Ave 17: Ganso
ganso(Res_4, Res_5, Res_6, Res_13, Res_17, Res_18, Res_19, Res_21, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_6 == 'SI',
    Res_13 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_21 == 'SI',
    Res_25 == 'SI'.

% Ave 18: Cisne
cisne(Res_4, Res_5, Res_17, Res_18, Res_19, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_25 == 'SI'.

% Ave 19: Pájaro Carpintero
carpintero(Res_4, Res_5, Res_10, Res_11, Res_17, Res_18, Res_19, Res_22, Res_25) :-
    Res_4 == 'SI',
    Res_5 == 'SI',
    Res_10 == 'SI',
    Res_11 == 'SI',
    Res_17 == 'SI',
    Res_18 == 'SI',
    Res_19 == 'SI',
    Res_22 == 'SI',
    Res_25 == 'SI'.

abrir_conexion :-
    odbc_connect('prologAves', _, [user('root'), password(''), alias(prologAves), open(once)]).

cerrar_conexion :-
    odbc_disconnect(prologAves).

ingresar_registro(N,A):-
    abrir_conexion,
    prep('INSERT INTO dbo.aves_consultas(nombre, apellidos) VALUES (?, ?)',
    [varchar(50), varchar(50)],_,[N,A]).

obtener_cone(Connection):-
    odbc_connect('prologAves', Connection,[user('root'), password(''), alias(prologAves), open(once)]).

prep(SQL, Type, Row, Values):-
    obtener_cone(Connection),
    odbc_prepare(Connection, SQL, Type, Statement),
    odbc_execute(Statement, Values, Row).

consultar_registro(F):-
    odbc_query('prologAves',
              'SELECT TOP 1 * FROM aves_consultas ORDER BY id DESC', F).


