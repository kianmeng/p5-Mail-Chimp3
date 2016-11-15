package Mail::Chimp3;

use 5.010001;
use Moo;
use strictures 2;
use namespace::autoclean 0.16;
use Types::Standard qw/ Num Str /;

with 'Web::API';

# ABSTRACT: An interface to mailchimp.com's RESTful Web API v3 using WEB::API

# VERSION: generated by DZP::OurPkgVersion

=head1 SYNOPSIS

This is for the MailChimp API v3.0.

Please refer to the API documentation at 
L<http://developer.mailchimp.com/documentation/mailchimp/reference/overview/>

    use Mail::Chimp3;

    my $mailchimp = Mail::Chimp3->new(
        api_key => $apikey,
    );

    my $response = $mailchimp->add_store(
        store_id => '123',
        cart_id  => '456',
    );

=head1 METHODS

=over

=item abuse_report

=item abuse_reports

=item add_authorized_app

=item add_automation_subscriber

=item add_batch

=item add_campaign

=item add_campaign_feedback

=item add_campaign_folder

=item add_cart

=item add_cart_line

=item add_conversation_message

=item add_customer

=item add_file_manager_file

=item add_file_manager_folder

=item add_interest

=item add_interest_category

=item add_list

=item add_member

=item add_member_note

=item add_merge_field

=item add_order

=item add_order_line

=item add_product

=item add_segment

=item add_segment_member

=item add_store

=item add_template

=item add_template_folder

=item add_twitter_card

=item add_variant

=item add_webhook

=item advice

=item authorized_app

=item authorized_apps

=item automation

=item automation_email

=item automation_emails

=item automation_subscriber

=item automation_subscribers

=item automations

=item batch

=item batches

=item campaign

=item campaign_content

=item campaign_feedback

=item campaign_feedbacks

=item campaign_folder

=item campaign_folders

=item campaign_send_checklist

=item campaigns

=item cancel_campaign

=item cart

=item cart_line

=item cart_lines

=item carts

=item click_detail

=item click_details

=item click_details_member

=item click_details_members

=item conversation

=item conversation_message

=item conversation_messages

=item conversations

=item customer

=item customers

=item delete_batch

=item delete_campaign

=item delete_campaign_feedback

=item delete_campaign_folder

=item delete_cart

=item delete_cart_line

=item delete_customer

=item delete_file_manager_file

=item delete_file_manager_folder

=item delete_interest

=item delete_interest_category

=item delete_list

=item delete_member

=item delete_member_note

=item delete_merge_field

=item delete_order

=item delete_order_line

=item delete_product

=item delete_segment

=item delete_segment_member

=item delete_store

=item delete_template

=item delete_template_folder

=item delete_variant

=item delete_webhook

=item domain_performance

=item eepurl

=item email_activity

=item file_manager_file

=item file_manager_files

=item file_manager_folder

=item file_manager_folders

=item growth_history

=item growth_history_month

=item interest

=item interest_categories

=item interest_category

=item interests

=item list

=item list_activity

=item list_clients

=item lists

=item locations

=item member

=item member_activity

=item member_email_activity

=item member_goals

=item member_note

=item member_notes

=item member_sent_to

=item member_unsubscribed

=item members

=item merge_field

=item merge_fields

=item order

=item order_line

=item order_lines

=item orders

=item pause_automation

=item pause_automation_email

=item pause_campaign

=item product

=item products

=item remove_automation_subscriber

=item removed_automation_subscribers

=item replicate_campaign

=item report

=item reports

=item resume_campaign

=item root

=item schedule_campaign

=item segment

=item segment_members

=item segments

=item send_campaign

=item sent_to

=item set_campaign_content

=item start_automation

=item start_automation_email

=item store

=item stores

=item sub_reports

=item template

=item template_default_content

=item template_folder

=item template_folders

=item templates

=item test_campaign

=item twitter_card

=item twitter_cards

=item unschedule_campaign

=item unsubscribed

=item update_campaign

=item update_campaign_feedback

=item update_campaign_folder

=item update_cart

=item update_cart_line

=item update_customer

=item update_file_manager_file

=item update_file_manager_folder

=item update_interest

=item update_interest_category

=item update_list

=item update_member

=item update_member_note

=item update_merge_field

=item update_order

=item update_order_line

=item update_segment

=item update_store

=item update_template

=item update_template_folder

=item update_variant

=item upsert_customer

=item upsert_member

=item upsert_variant

=item variant

=item variants

=item webhook

=item webhooks

=back

=cut

has endpoints => (
    is      => 'rw',
    default => sub {
        {
            root => { path => '/' },

            # authorized apps
            authorized_apps    => { path => 'authorized-apps' },
            authorized_app     => { path => 'authorized-apps/:app_id' },
            add_authorized_app => {
                method    => 'POST',
                path      => 'authorized-apps',
                mandatory => [ 'client_id', 'client_secret', ],
            },

            # automations
            automations      => { path => 'automations' },
            automation       => { path => 'automations/:workflow_id' },
            pause_automation => {
                method => 'POST',
                path   => 'automations/:workflow_id/actions/pause-all-emails',
            },
            start_automation => {
                method => 'POST',
                path   => 'automations/:workflow_id/actions/start-all-emails',
            },

            # automation emails
            automation_emails      => { path => 'automations/:workflow_id/emails' },
            automation_email       => { path => 'automations/:workflow_id/emails/:workflow_email_id' },
            pause_automation_email => {
                method => 'POST',
                path   => 'automations/:workflow_id/emails/:workflow_email_id/actions/pause',
            },
            start_automation_email => {
                method => 'POST',
                path   => 'automations/:workflow_id/emails/:workflow_email_id/actions/start',
            },
            add_automation_subscriber => {
                method    => 'POST',
                path      => 'automations/:workflow_id/emails/:workflow_email_id/queue',
                mandatory => ['email_address'],
            },
            automation_subscribers => {
                path => 'automations/:workflow_id/emails/:workflow_email_id/queue',
            },
            automation_subscriber => {
                path => 'automations/:workflow_id/emails/:workflow_email_id/queue/:subscriber_hash',
            },
            remove_automation_subscriber => {
                method    => 'POST',
                path      => 'automations/:workflow_id/removed-subscribers',
                mandatory => ['email_address'],
            },
            removed_automation_subscribers => { path => 'automations/:workflow_id/removed-subscribers' },

            # batch
            batches   => { path => 'batches' },
            batch     => { path => 'batches/:batch_id' },
            add_batch => {
                method    => 'POST',
                path      => 'batches',
                mandatory => ['operations'],
            },
            delete_batch => {
                method => 'DELETE',
                path   => 'batches/:batch_id',
            },

            # campaign folders
            campaign_folders    => { path => 'campaign-folders' },
            campaign_folder     => { path => 'campaign-folders/:folder_id' },
            add_campaign_folder => {
                method    => 'POST',
                path      => 'campaign-folders',
                mandatory => ['name'],
            },
            update_campaign_folder => {
                method    => 'PATCH',
                path      => 'campaign-folders/:folder_id',
                mandatory => ['name'],
            },
            delete_campaign_folder => {
                method => 'DELETE',
                path   => 'campaign-folders/:folder_id',
            },

            # campaigns
            campaigns    => { path => 'campaigns' },
            campaign     => { path => 'campaigns/:campaign_id' },
            add_campaign => {
                method    => 'POST',
                path      => 'campaigns',
                mandatory => [ 'type', 'settings' ],
            },
            update_campaign => {
                method    => 'PATCH',
                path      => 'campaigns/:campaign_id',
                mandatory => [ 'type', 'settings' ],
            },
            delete_campaign => {
                method => 'DELETE',
                path   => 'campaigns/:campaign_id',
            },
            cancel_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/cancel-send',
            },
            pause_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/pause',
            },
            replicate_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/replicate',
            },
            resume_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/resume',
            },
            schedule_campaign => {
                method    => 'POST',
                path      => 'campaigns/:campaign_id/actions/schedule',
                mandatory => ['schedule_time'],
            },
            send_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/send',
            },
            test_campaign => {
                method    => 'POST',
                path      => 'campaigns/:campaign_id/actions/test',
                mandatory => [ 'test_emails', 'send_type' ],
            },
            unschedule_campaign => {
                method => 'POST',
                path   => 'campaigns/:campaign_id/actions/unschedule',
            },
            campaign_content     => { path => 'campaigns/:campaign_id/content' },
            set_campaign_content => {
                method => 'PUT',
                path   => 'campaigns/:campaign_id/content',
            },
            campaign_feedbacks    => { path => 'campaigns/:campaign_id/feedback' },
            campaign_feedback     => { path => 'campaigns/:campaign_id/feedback/:feedback_id' },
            add_campaign_feedback => {
                method    => 'POST',
                path      => 'campaigns/:campaign_id/feedback',
                mandatory => ['message'],
            },
            update_campaign_feedback => {
                method    => 'PATCH',
                path      => 'campaigns/:campaign_id/feedback/:feedback_id',
                mandatory => ['message'],
            },
            delete_campaign_feedback => {
                method => 'DELETE',
                path   => 'campaigns/:campaign_id/feedback/:feedback_id',
            },
            campaign_send_checklist => { path => 'campaigns/:campaign_id/send-checklist' },

            # conversations
            conversations            => { path => 'conversations' },
            conversation             => { path => 'conversations/:conversation_id' },
            add_conversation_message => {
                method    => 'POST',
                path      => 'conversations/:conversation_id/messages',
                mandatory => [ 'from_email', 'read' ],
            },
            conversation_messages => { path => 'conversation/:conversation_id/messages' },
            conversation_message  => { path => 'conversation/:conversation_id/messages/:message_id' },

            # ecommerce stores
            stores    => { path => 'ecommerce/stores' },
            store     => { path => 'ecommerce/stores/:store_id' },
            add_store => {
                method    => 'POST',
                path      => 'ecommerce/stores',
                mandatory => [ 'id', 'list_id', 'name', 'currency_code', ],
            },
            update_store => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id',
            },
            delete_store => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id',
            },

            # ecommerce carts
            carts    => { path => 'ecommerce/stores/:store_id/carts' },
            cart     => { path => 'ecommerce/stores/:store_id/carts/:cart_id' },
            add_cart => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/carts',
                mandatory => ['customer'],
            },
            update_cart => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/carts/:cart_id',
            },
            delete_cart => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/carts/:cart_id',
            },

            # ecommerce cart lines
            cart_lines    => { path => 'ecommerce/stores/:store_id/carts/:cart_id/lines' },
            cart_line     => { path => 'ecommerce/stores/:store_id/carts/:cart_id/lines/:line_id' },
            add_cart_line => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/carts/:cart_id/lines',
                mandatory => [
                    qw/
                        id
                        product_id
                        product_variant_id
                        quantity
                        price
                        /
                ],
            },
            update_cart_line => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/carts/:cart_id/lines/:line_id',
            },
            delete_cart_line => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/carts/:cart_id/lines/:line_id',
            },

            # ecommerce customers
            customers    => { path => 'ecommerce/stores/:store_id/customers' },
            customer     => { path => 'ecommerce/stores/:store_id/customers/:customer_id' },
            add_customer => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/customers',
                mandatory => [
                    qw/
                        id
                        email_address
                        opt_in_status
                        /
                ],
            },
            update_customer => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/customers/:customer_id',
            },
            upsert_customer => {
                method    => 'PUT',
                path      => 'ecommerce/stores/:store_id/customers/:customer_id',
                mandatory => [
                    qw/
                        id
                        email_address
                        opt_in_status
                        /
                ],
            },
            delete_customer => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/customers/:customer_id',
            },

            # ecommerce orders
            orders    => { path => 'ecommerce/stores/:store_id/orders' },
            order     => { path => 'ecommerce/stores/:store_id/orders/:order_id' },
            add_order => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/orders',
                mandatory => [
                    qw/
                        id
                        customer
                        currency_code
                        order_total
                        lines
                        /
                ],
            },
            update_order => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/orders/:order_id',
            },
            delete_order => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/orders/:order_id',
            },

            # ecommerce order lines
            order_lines    => { path => 'ecommerce/stores/:store_id/orders/:order_id/lines' },
            order_line     => { path => 'ecommerce/stores/:store_id/orders/:order_id/lines/:line_id' },
            add_order_line => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/orders/:order_id/lines',
                mandatory => [
                    qw/
                        id
                        product_id
                        product_variant_id
                        quantity
                        price
                        /
                ],
            },
            update_order_line => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/orders/:order_id/lines/:line_id',
            },
            delete_order_line => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/orders/:order_id/lines/:line_id',
            },

            # ecommerce products
            products    => { path => 'ecommerce/stores/:store_id/products' },
            product     => { path => 'ecommerce/stores/:store_id/products/:product_id' },
            add_product => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/products',
                mandatory => [ 'id', 'title', 'variants', ],
            },
            delete_product => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/products/:product_id',
            },

            # ecommerce product variants
            variants    => { path => 'ecommerce/stores/:store_id/products/:product_id/variants' },
            variant     => { path => 'ecommerce/stores/:store_id/products/:product_id/variants/:variant_id' },
            add_variant => {
                method    => 'POST',
                path      => 'ecommerce/stores/:store_id/products/:product_id/variants',
                mandatory => [ 'id', 'title', ],
            },
            update_variant => {
                method => 'PATCH',
                path   => 'ecommerce/stores/:store_id/products/:product_id/variants/:variant_id',
            },
            upsert_variant => {
                method    => 'PUT',
                path      => 'ecommerce/stores/:store_id/products/:product_id/variants/:variant_id',
                mandatory => [ 'id', 'title', ],
            },
            delete_variant => {
                method => 'DELETE',
                path   => 'ecommerce/stores/:store_id/products/:product_id/variants/:variant_id',
            },

            # file manager files
            file_manager_files    => { path => 'file-manager/files' },
            file_manager_file     => { path => 'file-manager/files/:file_id' },
            add_file_manager_file => {
                method    => 'POST',
                path      => 'file-manager/files',
                mandatory => [ 'name', 'file_data' ],
            },
            update_file_manager_file => {
                method    => 'PATCH',
                path      => 'file-manager/files/:file_id',
                mandatory => [ 'name', 'file_data' ],
            },
            delete_file_manager_file => {
                method => 'DELETE',
                path   => 'file-manager/files/:file_id',
            },

            # file manager folders
            file_manager_folders    => { path => 'file-manager/folders' },
            file_manager_folder     => { path => 'file-manager/folders/:folder_id' },
            add_file_manager_folder => {
                method    => 'POST',
                path      => 'file-manager/folders',
                mandatory => ['name'],
            },
            update_file_manager_folder => {
                method    => 'PATCH',
                path      => 'file-manager/folders/:folder_id',
                mandatory => ['name'],
            },
            delete_file_manager_folder => {
                method => 'DELETE',
                path   => 'file-manager/folders/:folder_id',
            },

            # lists
            lists    => { path => 'lists' },
            list     => { path => 'lists/:list_id' },
            add_list => {
                method    => 'POST',
                path      => 'lists',
                mandatory => [
                    qw/
                        name
                        contact
                        permission_reminder
                        campaign_defaults
                        email_type_option
                        /
                ],
            },
            update_list => {
                method    => 'PATCH',
                path      => 'lists/:list_id',
                mandatory => [
                    qw/
                        name
                        contact
                        permission_reminder
                        campaign_defaults
                        email_type_option
                        /
                ],
            },
            delete_list => {
                method => 'DELETE',
                path   => 'lists/:list_id',
            },
            batch_list => {
                method => 'POST',
                path   => 'lists/:list_id',
                mandatory => ['members'],
            },
            abuse_reports        => { path => 'lists/:list_id/abuse-reports' },
            abuse_report         => { path => 'lists/:list_id/abuse-reports/:report_id' },
            list_activity        => { path => 'lists/:list_id/activity' },
            list_clients         => { path => 'lists/:list_id/clients' },
            growth_history       => { path => 'lists/:list_id/growth-history' },
            growth_history_month => { path => 'lists/:list_id/growth-history/:month' },

            # list interests
            interest_categories   => { path => 'lists/:list_id/interest-categories' },
            interest_category     => { path => 'lists/:list_id/interest-categories/:interest_category_id' },
            add_interest_category => {
                method    => 'POST',
                path      => 'lists/:list_id/interest-categories',
                mandatory => [ 'title', 'type' ],
            },
            update_interest_category => {
                method    => 'PATCH',
                path      => 'lists/:list_id/interest-categories/:interest_category_id',
                mandatory => [ 'title', 'type' ],
            },
            delete_interest_category => {
                method => 'DELETE',
                path   => 'lists/:list_id/interest-categories/:interest_category_id',
            },
            interests    => { path => 'lists/:list_id/interest-categories/:interest_category_id/interests' },
            interest     => { path => 'lists/:list_id/interest-categories/:interest_category_id/interests/:interest_id' },
            add_interest => {
                method    => 'POST',
                path      => 'lists/:list_id/interest-categories/:interest_category_id/interests',
                mandatory => ['name'],
            },
            update_interest => {
                method    => 'PATCH',
                path      => 'lists/:list_id/interest-categories/:interest_category_id/interests/:interest_id',
                mandatory => ['name'],
            },
            delete_interest => {
                method => 'DELETE',
                path   => 'lists/:list_id/interest-categories/:interest_category_id/interests/:interest_id',
            },

            # list members
            members    => { path => 'lists/:list_id/members' },
            member     => { path => 'lists/:list_id/members/:subscriber_hash' },
            add_member => {
                method    => 'POST',
                path      => 'lists/:list_id/members',
                mandatory => [ 'status', 'email_address', ],
            },
            update_member => {
                method => 'PATCH',
                path   => 'lists/:list_id/members/:subscriber_hash',
            },
            upsert_member => {
                method    => 'PUT',
                path      => 'lists/:list_id/members/:subscriber_hash',
                mandatory => [
                    qw/
                        email_address
                        status_if_new
                        /
                ],
            },
            delete_member => {
                method => 'DELETE',
                path   => 'lists/:list_id/members/:subscriber_hash',
            },
            member_activity => { path => 'lists/:list_id/members/:subscriber_hash/activity' },
            member_goals    => { path => 'lists/:list_id/members/:subscriber_hash/goals' },

            # list member notes
            member_notes    => { path => 'lists/:list_id/members/:subscriber_hash/notes' },
            member_note     => { path => 'lists/:list_id/members/:subscriber_hash/notes/:note_id' },
            add_member_note => {
                method    => 'POST',
                path      => 'lists/:list_id/members/:subscriber_hash/notes',
                mandatory => ['note'],
            },
            update_member_note => {
                method    => 'POST',
                path      => 'lists/:list_id/members/:subscriber_hash/notes/:note_id',
                mandatory => ['note'],
            },
            delete_member_note => {
                method => 'DELETE',
                path   => 'lists/:list_id/members/:subscriber_hash/notes/:note_id',
            },

            # list merge fields
            merge_fields    => { path => 'lists/:list_id/merge-fields' },
            merge_field     => { path => 'lists/:list_id/merge-fields/:merge_id' },
            add_merge_field => {
                method    => 'POST',
                path      => 'lists/:list_id/merge-fields',
                mandatory => [ 'name', 'type', ],
            },
            update_merge_field => {
                method => 'PATCH',
                path   => 'lists/:list_id/merge-fields/:merge_id',
            },
            delete_merge_field => {
                method => 'DELETE',
                path   => 'lists/:list_id/merge-fields/:merge_id',
            },

            # list segments
            segments    => { path => 'lists/:list_id/segments' },
            segment     => { path => 'lists/:list_id/segments/:segment_id' },
            add_segment => {
                method    => 'POST',
                path      => 'lists/:list_id/segments',
                mandatory => ['name'],
            },
            update_segment => {
                method => 'PATCH',
                path   => 'lists/:list_id/segments/:segment_id',
            },
            delete_segment => {
                method => 'DELETE',
                path   => 'lists/:list_id/segments/:segment_id',
            },
            segment_members    => { path => 'lists/:list_id/segments/:segment_id/members' },
            add_segment_member => {
                method => 'POST',
                path   => 'lists/:list_id/segments/:segment_id/members'
            },
            delete_segment_member => {
                method => 'DELETE',
                path   => 'lists/:list_id/segments/:segment_id/members/:subscriber_hash'
            },

            # list other
            twitter_cards    => { path => 'lists/:list_id/twitter-lead-gen-cards' },
            twitter_card     => { path => 'lists/:list_id/twitter-lead-gen-cards/:twitter_card_id' },
            add_twitter_card => {
                method    => 'POST',
                path      => 'lists/:list_id/twitter-lead-gen-cards',
                mandatory => [
                    qw/
                        name
                        title
                        cta_text
                        privacy_policy_url
                        image_url
                        twitter_account_id
                        /
                ],
            },
            webhooks    => { path => 'lists/:list_id/webhooks' },
            webhook     => { path => 'lists/:list_id/webhooks/:webhook_id' },
            add_webhook => {
                method => 'POST',
                path   => 'lists/:list_id/webhooks'
            },
            delete_webhook => {
                method => 'DELETE',
                path   => 'lists/:list_id/webhooks/:webhook_id'
            },

            # reports
            reports               => { path => 'reports' },
            report                => { path => 'reports/:campaign_id' },
            abuse_reports         => { path => 'reports/:campaign_id/abuse-reports' },
            abuse_report          => { path => 'reports/:campaign_id/abuse-reports/:report_id' },
            advice                => { path => 'reports/:campaign_id/advice' },
            click_details         => { path => 'reports/:campaign_id/click-details' },
            click_detail          => { path => 'reports/:campaign_id/click-details/:link_id' },
            click_details_members => { path => 'reports/:campaign_id/click-details/:link_id/members' },
            click_details_member  => { path => 'reports/:campaign_id/click-details/:link_id/members/:subscriber_hash' },
            domain_performance    => { path => 'reports/:campaign_id/domain-performance' },
            eepurl                => { path => 'reports/:campaign_id/eepurl' },
            email_activity        => { path => 'reports/:campaign_id/email-activity' },
            member_email_activity => { path => 'reports/:campaign_id/email-activity/:subscriber_hash' },
            locations             => { path => 'reports/:campaign_id/locations' },
            sent_to               => { path => 'reports/:campaign_id/sent-to' },
            member_sent_to        => { path => 'reports/:campaign_id/sent-to/:subscriber_hash' },
            sub_reports           => { path => 'reports/:campaign_id/sub-reports' },
            unsubscribed          => { path => 'reports/:campaign_id/unsubscribed' },
            member_unsubscribed   => { path => 'reports/:campaign_id/unsubscribed/:subscriber_hash' },

            # template folders
            template_folders    => { path => 'template-folders' },
            template_folder     => { path => 'template-folders/:folder_id' },
            add_template_folder => {
                method    => 'POST',
                path      => 'template-folders',
                mandatory => ['name'],
            },
            update_template_folder => {
                method    => 'PATCH',
                path      => 'template-folders/:folder_id',
                mandatory => ['name'],
            },
            delete_template_folder => {
                method => 'DELETE',
                path   => 'template-folders/:folder_id',
            },

            # templates
            templates    => { path => 'templates' },
            template     => { path => 'templates/:template_id' },
            add_template => {
                method    => 'POST',
                path      => 'templates',
                mandatory => [ 'name', 'html' ],
            },
            update_template => {
                method    => 'PATCH',
                path      => 'templates/:template_id',
                mandatory => [ 'name', 'html' ],
            },
            delete_template => {
                method => 'DELETE',
                path   => 'templates/:template_id',
            },
            template_default_content => { path => 'templates/:template_id/default-content' },
        };
    },
);

has api_version => (
    is      => 'ro',
    isa     => Num,
    default => sub { '3.0' },
);

has datacenter => (
    is      => 'lazy',
    isa     => Str,
    default => sub {
        my $self = shift;
        if ($self->api_key) {
            my ($dc) = ( $self->api_key =~ /\-(\w+)$/ );
            return $dc;
        }
        else {
            return 'us1';
        }
    },
);

has '+decoder' => (
    builder => 1,
);

=head1 INTERNALS

=over

=cut

sub _build_decoder {
    my $self = shift;
    return sub {
        my ($content, $content_type) = @_;
        my $data = {};
        return $data unless $content;
        for ($content_type) {
            /plain/ and do {
                chomp $content;
                $data = { text => $content };
            };
            /urlencoded/ and do {
                for (split /&/, $content) {
                    my ($key, $value) = split /=/;
                    $data->{ uri_unescape($key) } = uri_unescape($value);
                }
            };
            /json/ and $data = $self->json->decode($content);
            /(xml|html)/ and $data = $self->xml->XMLin( $content, NoAttr => 0 );
        }
        return $data;
    };
}

=item commands

Required by Web::API

=back

=cut

sub commands {
    my ($self) = @_;
    return $self->endpoints;
}

=head2 BUILD

basic configuration for the client API happens usually in the BUILD method when using Web::API

=cut

sub BUILD {
    my ($self) = @_;

    $self->user_agent( __PACKAGE__ . ' ' . ($Mail::Chimp3::VERSION || '') );
    $self->base_url( 'https://' . $self->datacenter . '.api.mailchimp.com/' . $self->api_version );
    $self->auth_type('basic');
    $self->user('anystring');
    $self->content_type('application/json');

    return $self;
}

=head1 BUGS

Please report any bugs or feature requests on GitHub's issue tracker L<https://github.com/jdigory/p5-Mail-Chimp3/issues>.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Mail::Chimp3

You can also look for information at:

=over 4

=item * GitHub repository

L<https://github.com/jdigory/p5-Mail-Chimp3>

=back

=cut

1;
