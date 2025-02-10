import 'package:care_garden/controllers/planta_formulario_controlador.dart';
import 'package:care_garden/models/planta.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantaFormulario extends StatefulWidget {
  final PlantaFormularioControlador controlador;

  const PlantaFormulario({
    super.key,
    required this.controlador,
  });

  @override
  State<PlantaFormulario> createState() => _PlantaFormularioState();
}

class _PlantaFormularioState extends State<PlantaFormulario> {
  DateTime? dataAquisicao;
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, dynamic>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final planta = ModalRoute.of(context)?.settings.arguments;

    if (_formData.isEmpty && planta != null) {
      planta as Planta;
      _formData['id'] = planta.id;
      _formData['caminhoFoto'] = planta.caminhoFoto;
      _formData['nome'] = planta.nome;
      _formData['dataDeAquisicao'] = planta.dataDeAquisicao;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Planta'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: widget.controlador.selecionarImage,
              label: Text('Escolher uma imagem'),
            ),
            TextFormField(
              initialValue: _formData['nome'] ?? '',
              decoration: InputDecoration(
                label: Text('Nome da planta'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dataAquisicao != null
                        ? DateFormat('dd MMM yyyy').format(dataAquisicao!)
                        : 'Sem data definida',
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {
                      widget.controlador.abrirModalSelecaoData(context).then(
                            (novaData) => setState(
                              () {
                                dataAquisicao = novaData;
                              },
                            ),
                          );
                    },
                    label: Text('Data de aquisição da planta'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
