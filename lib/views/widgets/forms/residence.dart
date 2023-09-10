import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/residence.dart';
import 'package:web_school/models/option.dart';
import 'package:web_school/networks/application.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/views/widgets/buttons/dropdown.dart';
import 'package:web_school/views/widgets/fields/dropdown.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

class ResidenceForm extends StatefulWidget {
  const ResidenceForm({
    this.residenceInfo,
    this.viewOnly = false,
    super.key,
  });

  final ResidenceInfo? residenceInfo;
  final bool viewOnly;

  @override
  State<ResidenceForm> createState() => _ResidenceFormState();
}

class _ResidenceFormState extends State<ResidenceForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Application application =
          Provider.of<Application>(context, listen: false);

      if (widget.viewOnly) {
        setState(() {
          final ResidenceInfo residenceInfo = widget.residenceInfo!;
          application.currentHousehold = residenceInfo.household;
          Application.address.text = residenceInfo.currentAddress.address;
          Application.barangay.text = residenceInfo.currentAddress.barangay;
          Application.city.text = residenceInfo.currentAddress.city;
          Application.province.text = residenceInfo.currentAddress.province;
          Application.region.text = residenceInfo.currentAddress.region;

          Application.familyAddress.text = residenceInfo.familyAddress.address;
          Application.familyBarangay.text =
              residenceInfo.familyAddress.barangay;
          Application.familyCity.text = residenceInfo.familyAddress.city;
          Application.familyProvince.text =
              residenceInfo.familyAddress.province;
          Application.familyRegion.text = residenceInfo.familyAddress.region;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Application application = Provider.of<Application>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 12.0),
        Text(
          "B.2. Residence",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12.0),
        widget.viewOnly
            ? PrimaryTextField(
                controller: TextEditingController(
                    text: application.currentHousehold?.label),
                label: "Household currently living in",
              )
            : CustomDropdown<SelectionOption>(
                initialValue: application.currentHousehold,
                value: application.currentHousehold,
                label: "Household currently wliving in",
                hintText: 'Select',
                items: application.householdList.map((SelectionOption option) {
                  return SchoolDropdownMenuItem<SelectionOption>(
                    value: option,
                    label: option.label!,
                    child: SchoolDropdown(
                      option: option,
                    ),
                  );
                }).toList(),
                onChanged: application.updateCurrentHousehold,
                validator: Commons.forcedDropdownValidator,
              ),

        Text(
          "Current Residence",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        // Row(
        //   children: [
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.2,
        //         child: const Text("B.3.1. Household Currently living in",)),
        //     const SizedBox(width: 12.0),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: application.householdList.map((SelectionOption value) {
        //         return Padding(
        //           padding: const EdgeInsets.only(top: 12.0),
        //           child: CustomRadioButton(
        //             value: application.currentHousehold == value,
        //             onTap: () => application.updateCurrentHousehold(value),
        //             label: value.label,
        //           ),
        //         );
        //       }).toList(),
        //     ),
        //   ],
        // ),
        PrimaryTextField(
          fieldKey: Application.addressKey,
          controller: Application.address,
          hintText: "Address",
          label: "House Number & Street of Barangay Zone/Purok",
          validator: Commons.forcedTextValidator,
        ),

        PrimaryTextField(
          fieldKey: Application.barangayKey,
          controller: Application.barangay,
          hintText: "Barangay",
          label: "Barangay",
          validator: Commons.forcedTextValidator,
        ),

        PrimaryTextField(
          fieldKey: Application.cityKey,
          controller: Application.city,
          hintText: "City",
          label: "City/Municipality",
          validator: Commons.forcedTextValidator,
        ),

        PrimaryTextField(
          fieldKey: Application.provinceKey,
          controller: Application.province,
          hintText: "Province",
          label: "Province",
          validator: Commons.forcedTextValidator,
        ),

        PrimaryTextField(
          fieldKey: Application.regionKey,
          controller: Application.region,
          hintText: "Region",
          label: "Region",
          validator: Commons.forcedTextValidator,
        ),

        const SizedBox(height: 12.0),

        Text(
          "Address of Family, if not living in the household of the family",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

        PrimaryTextField(
          fieldKey: Application.familyAddressKey,
          controller: Application.familyAddress,
          hintText: "Address",
          label: "House Number & Street of Barangay Zone/Purok",
        ),

        PrimaryTextField(
          fieldKey: Application.familyBarangayKey,
          controller: Application.familyBarangay,
          hintText: "Barangay",
          label: "Barangay",
        ),

        PrimaryTextField(
          fieldKey: Application.familyCityKey,
          controller: Application.familyCity,
          hintText: "City",
          label: "City/Municipality",
        ),

        PrimaryTextField(
          fieldKey: Application.familyProvinceKey,
          controller: Application.familyProvince,
          hintText: "Province",
          label: "Province",
        ),

        PrimaryTextField(
          fieldKey: Application.familyRegionKey,
          controller: Application.familyRegion,
          hintText: "Region",
          label: "Region",
        ),
      ],
    );
  }
}
