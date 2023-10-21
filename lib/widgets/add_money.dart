import 'package:cred_neo_pop_button/widgets/custom_neopop_button.dart';
import 'package:cred_neo_pop_button/widgets/custom_shimmer_button.dart';
import 'package:flutter/material.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(8.0, 8.0))
          ],
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(24.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffE2E0FB),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, offset: Offset(1.0, 1.0))
                    ],
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: const Text(
                    '₹',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text('42,069',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All time gains:'),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      Text(
                        '₹2,503',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Past 1-year CAGR:'),
                  Row(
                    children: [
                      Text(
                        '8.5% ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.info_outline_rounded,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0.0, 24.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomNeoPopButton(
                    onPressed: () {},
                    height: 56.0,
                    width: 120,
                    color: const Color(0xFF33FE91),
                    borderColor: Colors.white,
                    buttonText: const Text(
                      'Add Money',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: CustomShimmerButton(
                    shimmerColor: Colors.white38,
                    width: 120,
                    child: CustomNeoPopButton(
                      height: 56.0,
                      width: 120,
                      borderColor: Colors.white,
                      color: const Color(0xffFFD700),
                      onPressed: () {},
                      buttonText: const Text(
                        'Scan & Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
