update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from period_unit), 1) where name='period_unit';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from invoice_delivery_method), 1) where name='invoice_delivery_method';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_line_type), 1) where name='order_line_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_billing_type), 1) where name='order_billing_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from pluggable_task_type_category), 1) where name='pluggable_task_type_category';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from user_credit_card_map), 1) where name='user_credit_card_map';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from user_status), 1) where name='user_status';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_status), 1) where name='order_status';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from invoice_line_type), 1) where name='invoice_line_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from currency), 1) where name='currency';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from report_type), 1) where name='report_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from payment_method), 1) where name='payment_method';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from payment_result), 1) where name='payment_result';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from event_log_module), 1) where name='event_log_module';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from event_log_message), 1) where name='event_log_message';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from preference_type), 1) where name='preference_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from country), 1) where name='country';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from currency_exchange), 1) where name='currency_exchange';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from billing_process_configuration), 1) where name='billing_process_configuration';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_period), 1) where name='order_period';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from report), 1) where name='report';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from entity), 1) where name='entity';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from billing_process), 1) where name='billing_process';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from process_run), 1) where name='process_run';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from process_run_total), 1) where name='process_run_total';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from ageing_entity_step), 1) where name='ageing_entity_step';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from item_price), 1) where name='item_price';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from purchase_order), 1) where name='purchase_order';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_line), 1) where name='order_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from invoice), 1) where name='invoice';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from invoice_line), 1) where name='invoice_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_process), 1) where name='order_process';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from payment), 1) where name='payment';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from language), 1) where name='language';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from payment_invoice), 1) where name='payment_invoice';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from blacklist), 1) where name='blacklist';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from promotion), 1) where name='promotion';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from partner_payout), 1) where name='partner_payout';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from process_run_total_pm), 1) where name='process_run_total_pm';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from payment_authorization), 1) where name='payment_authorization';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from paper_invoice_batch), 1) where name='paper_invoice_batch';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from filter), 1) where name='filter';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from filter_set), 1) where name='filter_set';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from shortcut), 1) where name='shortcut';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from report_parameter), 1) where name='report_parameter';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from customer), 1) where name='customer';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from base_user), 1) where name='base_user';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from partner), 1) where name='partner';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from contact_map), 1) where name='contact_map';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from contact), 1) where name='contact';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from discount), 1) where name='discount';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from discount_line), 1) where name='discount_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from asset_transition), 1) where name='asset_transition';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from notification_message_arch_line), 1) where name='notification_message_arch_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from notification_message_type), 1) where name='notification_message_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from asset), 1) where name='asset';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from asset_status), 1) where name='asset_status';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from notification_message_arch), 1) where name='notification_message_arch';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from data_table_query_entry), 1) where name='data_table_query_entry';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from data_table_query), 1) where name='data_table_query';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from recent_item), 1) where name='recent_item';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_change), 1) where name='order_change';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from notification_category), 1) where name='notification_category';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from meta_field_group), 1) where name='meta_field_group';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from pluggable_task_parameter), 1) where name='pluggable_task_parameter';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from pluggable_task), 1) where name='pluggable_task';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from meta_field_name), 1) where name='meta_field_name';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from meta_field_value), 1) where name='meta_field_value';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from enumeration), 1) where name='enumeration';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from role), 1) where name='role';
update jbilling_seqs set next_id=coalesce((select round(max(id)/1000)+1 from enumeration_values), 1) where name='enumeration_values';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from item_dependency), 1) where name='item_dependency';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from preference), 1) where name='preference';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from mediation_process), 1) where name='mediation_process';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from mediation_record_line), 1) where name='mediation_record_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from user_code), 1) where name='user_code';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from user_code_link), 1) where name='user_code_link';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from payment_method_template), 1) where name='payment_method_template';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from notification_message), 1) where name='notification_message';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from mediation_record), 1) where name='mediation_record';
update jbilling_seqs set next_id=coalesce((select round(max(id)/1)+1 from generic_status), 1) where name='generic_status';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from notification_message_section), 1) where name='notification_message_section';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from customer_account_info_type_timeline), 1) where name='customer_account_info_type_timeline';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from payment_information), 1) where name='payment_information';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from payment_method_type), 1) where name='payment_method_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from payment_instrument_info), 1) where name='payment_instrument_info';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from account_type), 1) where name='account_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from notification_message_line), 1) where name='notification_message_line';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from customer_notes), 1) where name='customer_notes';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from rating_unit), 1) where name='rating_unit';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from matching_field), 1) where name='matching_field';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from route), 1) where name='route';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from order_change_type), 1) where name='order_change_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from pluggable_task_type), 1) where name='pluggable_task_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/1)+1 from breadcrumb), 1) where name='breadcrumb';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from item_type), 1) where name='item_type';
update jbilling_seqs set next_id=coalesce((select round(max(id)/100)+1 from item), 1) where name='item';
update jbilling_seqs set next_id=coalesce((select round(max(id)/10)+1 from mediation_cfg), 1) where name='mediation_cfg';
update jbilling_seqs set next_id=coalesce((select round(max(id)/1000)+1 from event_log), 1) where name='event_log';
