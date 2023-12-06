import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pedido: ${order.id}"),
              Text(
                UtilsServices.formateDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((orderItem) {
                        return _OrderItemWidget(
                          orderItem: orderItem,
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel orderItem;
  const _OrderItemWidget({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            "${orderItem.quantity} ${orderItem.item.unit} ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
            ),
          ),
          Text(
            UtilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          ),
        ],
      ),
    );
  }
}
