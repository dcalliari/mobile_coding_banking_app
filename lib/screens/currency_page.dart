import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCurrencyPage extends StatefulWidget {
  const MyCurrencyPage({super.key});

  @override
  State<MyCurrencyPage> createState() => _MyCurrencyPageState();
}

class _MyCurrencyPageState extends State<MyCurrencyPage> {
  final TextEditingController amountController = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'CAD';
  String? result;
  bool isLoading = false;
  double exchangeRate = 0.0;

  Future<void> convertCurrency() async {
    const apiKey =
        'a81e314fa3a954df7900d263'; // Substitua pela sua chave de API
    final amount = amountController.text;
    final url =
        'https://v6.exchangerate-api.com/v6/$apiKey/pair/$fromCurrency/$toCurrency/$amount';

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = data['conversion_result'].toString();
          exchangeRate = data['conversion_rate'];
        });
      } else {
        setState(() {
          result = 'Erro ao obter cotação';
        });
      }
    } catch (e) {
      setState(() {
        result = 'Erro ao obter cotação';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Conversão',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insira o valor para a conversão',
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: fromCurrency,
                    items:
                        ['USD', 'CAD', 'EUR', 'BRL', 'GBP'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        fromCurrency = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.swap_horiz),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: toCurrency,
                    items:
                        ['USD', 'CAD', 'EUR', 'BRL', 'GBP'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        toCurrency = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: convertCurrency,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('CONVERTER'),
              ),
              const SizedBox(height: 20),
              if (isLoading) const CircularProgressIndicator(),
              if (result != null)
                Column(
                  children: [
                    const Text(
                      'Resultado:',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      '$result',
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'câmbio atual: $exchangeRate',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
