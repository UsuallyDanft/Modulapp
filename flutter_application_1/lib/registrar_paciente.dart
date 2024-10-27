import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrarPaciente extends StatefulWidget {
  const RegistrarPaciente({super.key});

  @override
  State<RegistrarPaciente> createState() => _RegistrarPacienteState();
}

class _RegistrarPacienteState extends State<RegistrarPaciente> {
  DateTime? _selectedDate;
  String _selectedGender = 'Femenino';

// metodo para el datepicker
  Widget _buildDateTimeField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: _selectedDate != null
                  ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                  : '',
            ),
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null && picked != _selectedDate) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 103, 189, 242), width: 4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue, width: 4),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/calendar.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // fin del metodo para el datepicker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Esto quita la flecha de retorno (es una flechita que flutter agrega automaticamente)
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 135, 230),
        title: const Text(
          'Modulapp',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 62.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/pacientes.png',
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'Registrar Paciente',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildLabeledTextField('Nombre'),
              _buildLabeledTextField('Apellido'),
              _buildDateTimeField('Fecha de Nacimiento'),
              _buildLabeledTextField('Edad'),
              _buildGenderSelector(),
              _buildLabeledTextField('Dirección'),
              _buildLabeledTextField('Teléfono'),
            ],
          ),
        ),
      ),

      // barra de navegacion
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 114, 135, 230),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 1, // Índice del ítem seleccionado (Home)
            onTap: (index) {
              if (index == 1) {
                // Si se toca el ítem Home, volvemos a la pantalla anterior (main.dart)
                Navigator.of(context).pop();
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_buscar.png')),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_home.png')),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icono_config.png')),
                label: 'Configuración',
              ),
            ],
          ),
        ),
      ),
    );
  }
  // fin de la barra de navegacion

  Widget _buildLabeledTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 1),
          TextField(
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(221, 0, 0, 0),
            ),
            keyboardType: (label == 'Teléfono' || label == 'Edad')
                ? TextInputType.number
                : TextInputType.text,
            inputFormatters: _getInputFormatters(label),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 103, 189, 242), width: 4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 33, 150, 243), width: 4),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }

  List<TextInputFormatter>? _getInputFormatters(String label) {
    switch (label) {
      case 'Nombre':
      case 'Apellido':
        return [LengthLimitingTextInputFormatter(20)];
      case 'Dirección':
        return [LengthLimitingTextInputFormatter(50)];
      case 'Teléfono':
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(11),
        ];
      case 'Edad':
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ];
      default:
        return null;
    }
  }

  Widget _buildGenderSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sexo',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.normal,
              fontFamily: 'Ubuntu',
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 103, 189, 242), width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
              items: <String>['Femenino', 'Masculino']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
