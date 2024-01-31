import 'package:exercise_admin_application/data/models/province_model.dart';
import 'package:exercise_admin_application/data/models/regency_model.dart';
import 'package:exercise_admin_application/utils/get_provinces.dart';
import 'package:exercise_admin_application/utils/get_regencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/create_cubit.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: BlocProvider(
        create: (context) => CreateCubit(),
        child: FormContent(),
      ),
    );
  }
}
class FormContent extends StatefulWidget {
  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tempatTanggalLahirController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController pendidikanController = TextEditingController();
  final UtilGetProvinces utilGetProvinces = UtilGetProvinces();
  final UtilGetRegencies utilGetRegencies = UtilGetRegencies();
  List<Province>? provinceList;
  List<Regency>? regencyList;
  Province? selectedProvince;
  Regency? selectedRegency;

  @override
  void initState() {
    super.initState();
    _loadProvinciesandRegencies();
  }

  Future<void> _loadProvinciesandRegencies() async {
    try {
      List<Province> provinces = await utilGetProvinces.getProvinces();
      List<Regency> regencies = await utilGetRegencies.getAllRegencies();
      setState(() {
        provinceList = provinces;
        regencyList = regencies;
      });
    } catch (error) {
      // Handle error
      print('Error loading dropdown data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCubit, CreateCubitState>(
      listener: (context, state) {
        // Handle state changes if needed
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh dikosongkan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: tempatTanggalLahirController,
                decoration: InputDecoration(labelText: 'Tempat tanggal lahir'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tempat tanggal lahir tidak boleh dikosongkan';
                  }
                  return null;
                },
              ),
              if(provinceList != null)
                DropdownButtonFormField<Province>(
                  items: provinceList!.map((province) => DropdownMenuItem<Province>(
                      value: province,
                      child: Text(province.name ?? ''),)).toList(),
                  onChanged: (Province? newValue) {
                    setState(() {
                      selectedProvince = newValue;
                    });
                    _handleSelectedProvince(newValue);
                  },
                  decoration: InputDecoration(
                    labelText: 'Provinsi',
                    border: OutlineInputBorder(),
                  ),
              ),
              if(regencyList != null)
                DropdownButtonFormField<Regency>(
                  items: regencyList!.map((regency) => DropdownMenuItem<Regency>(
                    value: regency,
                    child: Text(regency.name ?? ''),)).toList(),
                  onChanged: (Regency? newValue) {
                    setState(() {
                      selectedRegency = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Kabupaten',
                    border: OutlineInputBorder(),
                  ),
                ),
              TextFormField(
                controller: pekerjaanController,
                decoration: InputDecoration(labelText: 'Tempat tanggal lahir'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pekerjaan tidak boleh dikosongkan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: pendidikanController,
                decoration: InputDecoration(labelText: 'Tempat tanggal lahir'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pendidikan tidak boleh dikosongkan';
                  }
                  return null;
                },
              ),
              // Other form fields with controllers

              ElevatedButton(
                onPressed: () {
                  if (Form.of(context)?.validate() ?? false) {
                    context.read<CreateCubit>().submitForm(
                        nama: namaController.text,
                        tempat_tanggal_lahir: tempatTanggalLahirController.text,
                        kabupaten: selectedRegency?.name ?? '',
                        provinsi: selectedProvince?.name ?? '',
                        pekerjaan: pekerjaanController.text,
                        pendidikan: pendidikanController.text
                    );
                  }
                },
                child: Text('Submit Form'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleSelectedProvince(Province? selectedProvince) async {
    if(selectedProvince != null) {
      List<Regency> regencies = await utilGetRegencies.getRegenciesByProvinceId(selectedProvince.id);
      setState(() {
        regencyList = regencies;
      });
      // _updateRegencies(regencyList);
    } else {
      List<Regency> regencies = await utilGetRegencies.getAllRegencies();
      setState(() {
        regencyList = regencies;
      });
    }
  }
}

