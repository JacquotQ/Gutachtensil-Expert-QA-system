% 定义问题结构
% question(FirstLevel, SecondLevel, ThirdLevel, FourthLevel, FifthLevel, Text, AnswerType, AnswersToNextQuestions).

% root
node(root_is_contract_established,'是否有合同?即合同是否已经签订，存在书面或者口头的合同。如果确定请输入根据是或否输入yes或者no，如果不确定,请输入not sure进入下一个问题', %q1
    [(yes, is_contract_invalid),%
     (no, request_right_not_existed),
     (not_sure, is_offer_existed)
    ]).
node(is_contract_invalid,'合同只要成立，依据中华人民共和国民法典第502条，无特殊情况自成立时即生效，合同是否无效?如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', %q2
    [(yes, request_right_not_existed),
     (not_sure, lack_of_civil_conduct_capacity), %q7
     (no,is_contract_unsettle) %q4
    ]).
node(is_offer_existed,'是否存在要约?要约是指是否有通过各种形式,比如通过对话形式,一斤西瓜30块钱卖不卖,比如通过邮件,信件,电话等方式询问是否订立合同,都属于要约,如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, is_promise_existed),
     (not_sure, is_offer_established), 
     (no,request_right_not_existed) 
    ]).
node(is_promise_existed,'是否存在承诺?接受订立合同邀请的人是否明确表示愿意订立合同？只要存在承诺，则根据中华人民共和国民法典第483条，承诺生效时合同成立。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', %q2
    [(yes, is_contract_invalid), %q2
     (not_sure, is_promise_established), %q7
     (no,request_right_not_existed) %q4
    ]).
node(is_offer_established,'要约是否成立，即是否存在关于合同的要约？如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', %q6
    [(yes, is_promise_existed), %q5
     (not_sure, is_expression_of_intent_established), %q7
     (no,request_right_not_existed) %q4
    ]).
node(lack_of_civil_conduct_capacity,'合同签订中任意一方是否无民事行为能力？比如低于8周岁的儿童，或者完全无法辨认自己行为的成年人，比如严重智力障碍者？如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), %q22
     (not_sure, is_any_parties_below_8_years_old), 
     (no,is_mispresentation_exist) 
    ]).
node(is_expression_of_intent_established,'意思表示是否成立？是否作出了相应的订立合同的意思表示，比如表明愿意或者不愿意订立合同，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_intent_be_maked), %q22
     (not_sure, is_the_parties_has_explicit_and_objective_conduct), %q7
     (no,request_right_not_existed) 
    ]).
node(is_the_parties_has_explicit_and_objective_conduct,'是否存在客观的意思表示？可以简单理解为是否作出了行为，比如签名，点头，握手，如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_there_intent_behind_the_conduct), %q22
     (not_sure, need_more_information), %q7
     (no,request_right_not_existed) 
    ]).
node(is_there_intent_behind_the_conduct,'该客观的意思表示是否存在主观意愿？可以简单理解为行为是否体现了你作出行为的内心意愿，比如你可能醉酒情况下点头并不代表认同相应的合同条款，如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_expression_of_intent_be_maked), %q22
     (not_sure, need_more_information), %q7
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_be_maked,'意思表示是否作出？是否以某种方式作出了意思表示，比如明示，或者沉默，明示比如通过直接的言语，书面订购，默示包括在特定交易情况下无须通过直接的意思表示即可成立，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_invalid), %q22
     (not_sure, is_there_an_explicit_expression_of_intent), %q7
     (no,request_right_not_existed) 
    ]).
node(is_there_an_explicit_expression_of_intent,'是否存在明示的意思表示，比如信件，言语表示，或者行为，比如特定交易情况下的手势，如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_offer_invalid), 
     (not_sure, need_more_information), 
     (no,is_there_an_implicit_expression_of_intent) 
    ]).
node(is_there_an_implicit_expression_of_intent,'是否存在默示的意思表示，比如合同到期承租人继续使用租赁物，出租人没有异议的，租赁合同继续有效，包括无人值守的超市，标明收费的停车场，使用其服务时默认作出了相应的意思表示，如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_offer_invalid), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_mispresentation_exist,'合同是否存在虚假的意思表示，即作出的意思表示和内心所想不同，比如阴阳合同，即表面签订的合同与实际履行的合同不一致。如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),  
     (no, is_contract_violate_law_or_administrative_regulation) 
    ]).
node(is_contract_violate_law_or_administrative_regulation,'合同是否违反法律或者行政法规的规定？比如交易内容不合法，例如毒品交易，禁止交易部分。如果确定请输入根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, request_right_not_existed), 
     (not_sure, need_more_information),
     (no, is_contract_aim_to_damage_others_legitimate_right_and_interest_by_colluding_with_another_party) 
    ]).
node(is_contract_aim_to_damage_others_legitimate_right_and_interest_by_colluding_with_another_party, '合同是否是双方恶意串通，为损害他人合法权益的行为，比如为了逃避债务，假借合同将公司资产出卖。根据民法典第154条，行为人与相对人恶意串通，损害他人合法权益的民事法律行为无效。如果确定请输入根据是或否输入yes或者no,如果不确定，请输入not sure',
    [(yes, request_right_not_existed), 
     (not_sure, need_more_information),
     (no, is_contract_unsettle)
    ]).
node(is_contract_unsettle,'合同是否效力待定。比如存在与限制民事行为能力人签订的合同，比如年龄介于8-18周岁之间的人，或者存在智力障碍的成年人。根据民法典第22条，不能完全辨认自己行为的成年人为限制民事行为能力人，实施民事法律行为由其法定代理人代理或者经其法定代理人同意、追认；但是，可以独立实施纯获利益的民事法律行为或者与其智力、精神健康状况相适应的民事法律行为。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), 
     (not_sure, is_any_parties_between_8_to_18_years_old),
     (no, is_contract_revoked)
    ]).
node(is_any_parties_between_8_to_18_years_old,'合同签订中任意一方的年龄是否处于8-18周岁之间？根据民法典18条，成年人为完全民事行为能力人，可以独立实施民事法律行为。十六周岁以上的未成年，以自己的劳动收入为主要生活来源的，视为完全民事行为能力人。民法典第19条，八周岁以上的未成年人为限制民事行为能力人，实施民事法律行为由其法定代理人代理或者经其法定代理人同意、追认；但是，可以独立实施纯获利益的民事法律行为或者与其年龄、智力相适应的民事法律行为。第21条，不能辨认自己行为的成年人为无民事行为能力人，由其法定代理人代理实施民事法律行为。八周岁以上的未成年人不能辨认自己行为的，适用前款规定。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_the_contract_a_pure_acquisition_of_benefits_or_is_made_according_to_age),
     (no,wether_party_to_the_contract_lacks_the_authority_to_act_as_an_agent) 
    ]).
node(is_the_contract_a_pure_acquisition_of_benefits_or_is_made_according_to_age,'合同是否是纯粹的获取利益的行为？比如作为被赠与人，接受礼物等纯粹获得利益，对限制民事行为能力人没有损失的行为。根据民法典第19条，八周岁以上的未成年人为限制民事行为能力人，实施民事法律行为由其法定代理人代理或者经其法定代理人同意、追认；但是，可以独立实施纯获利益的民事法律行为或者与其年龄、智力相适应的民事法律行为。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_contract_revoked), 
     (not_sure, need_more_information),
     (no,is_the_legal_representative_recognized)
    ]).
node(is_the_legal_representative_recognized,'法定代理人是否已经承认已签订合同的效果？根据民法典第145条，限制民事行为能力人实施的纯获利益的民事法律行为或者与其年龄、智力、精神健康状况相 适应的民事法律行为有效;实施的其他民事法律行为经法定代理人同意或者追认后有效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_contract_revoked), 
     (not_sure, is_the_legal_representative_does_not_respond_after_30_days_upon_recipt_of_notice), 
     (no, request_right_not_existed) 
    ]).
node(is_the_legal_representative_does_not_respond_after_30_days_upon_recipt_of_notice,'法定代理人在收到通知后30天内有没有作出回应？根据民法典第145条第二款，经过相对人催告，法定代理人自收到通知之日起三十日内未作表示的，视为拒绝追认。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_contract_revoked), 
     (not_sure, need_more_information), 
     (no, request_right_not_existed) 
    ]).
node(wether_party_to_the_contract_lacks_the_authority_to_act_as_an_agent,'合同签订中一方是否缺乏行使代理权的行为能力？比如，非房屋所有权人出卖房屋？如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_the_principle_recognized), 
     (not_sure, need_more_information), 
     (no, request_right_not_existed) 
    ]).
node(is_the_principle_recognized,'有权代理人是否已经追认？根据民法典第171条第一款，行为人没有代理权，超越代理权或者代理权终止后，仍然实施代理行为，未经被代理人追认的，对被代理人不发生法律效力。比如房屋所有权人后期追认该房屋买卖合同的效力？如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, is_contract_revoked),
     (not_sure, is_the_principle_does_not_respond_after_30_days_upon_recipt_of_notice),
     (no, request_right_not_existed)
    ]).
node(is_the_principle_does_not_respond_after_30_days_upon_recipt_of_notice,'有权代理人在收到通知后30天内是否作出回应？根据民法典第171条第二款，相对人催告被代理人追认的，超过三十日内未作表示的，视为拒绝追认。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, is_contract_revoked),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_any_parties_below_8_years_old,'合同签订中任意一方的年龄是否小于8周岁？或者成年人但完全没有辨认自己行为的能力？无法辨认自己行为的人实施的民事法律行为，包括要约，承诺，签订合同等带有法律性质的行为均无效。根据民法典第20条，不满八周岁的未成年人为无民事行为能力人，由其法定代理人代理实施民事法律行为。根据民法典第21条，不能辨认自己行为的成年人为无民事行为能力人，由其法定代理人代理实施民事法律行为。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), 
     (not_sure, need_more_information),
     (no,is_any_parties_adult_but_lack_of_capacity) 
    ]).
node(is_any_parties_adult_but_lack_of_capacity,'合同签订中任意一方的是否成年但无法完全辨认自己的行为？根据民法典第22条，不能完全辨认自己行为的成年人为限制民事行为能力人，实施民事法律行为由其法定代理人代理或者经其法定代理人同意、追认；但是，可以独立实施纯获利益的民事法律行为或者与其智力、精神健康状况相适应的民事法律行为。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), 
     (not_sure, need_more_information),
     (no,is_mispresentation_exist) 
    ]).
node(is_offer_invalid,'要约是否生效，根据中华人民共和国第474条的规定，要约生效的时间适用中华人民共和国民法典第137条的规定，即意思表示以意思表示的接收人知道或者到达接收人时生效，比如口头要约在接收人听到并知道其要约内容生效，短信则以收到为生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_withdrawn), 
     (not_sure, is_expression_of_intent_make_to_specific_party), 
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_make_to_specific_party,'要约是否针对特定人作出。比如要约是否对一个特定的公司或者个人作出，指定这个人与你进行交易。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_intent_make_by_conversation), 
     (not_sure, is_expression_of_intent_of_promise_established), 
     (no, is_expression_of_intent_not_maked_to_specific_party) 
    ]).
node(is_expression_of_intent_not_maked_to_specific_party,'要约的表示是否没有针对特定人作出。比如遗嘱，抛弃财产，等不需要相对人的意思表示。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_non_specific_party_finished), 
     (not_sure, need_more_information),
     (no, is_expression_of_intent_maked_by_announcement)
    ]).
node(is_expression_of_non_specific_party_finished,'无相对人的要约的表示是否完成。比如以及发布遗嘱，已经抛弃财产。依据民法典第138条，无相对人的意思表示，表示完成时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_withdrawn), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_maked_by_announcement,'要约的表示是否以公告方式作出。比如通过媒体，网络，社交媒体，发布，广播，发布。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_announcement_published), 
     (not_sure, need_more_information),
     (no, need_more_information)
    ]).
node(is_expression_of_announcement_published,'要约的公告是否已发布。依据民法典第139条，以公告方式作出意思表示，公共发布时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_withdrawn), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_make_by_conversation,'要约的表示是否以对话方式作出。比如通过通话，日常对话等方式接受到该要约。依据民法典第137条，以对话方式发出要约，以相对人知道要约内容为生效时间。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_recipient_received_the_expression), 
     (not_sure, need_more_information), 
     (no,is_recipient_received_the_expression_by_non_conversation) 
    ]).
node(is_recipient_received_the_expression,'相对人是否知道该意思表示的内容，根据中华人民共和国民法典第137条，以对话方式作出的意思表示，相对人知道其内容或到达相对人相关电子系统时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_withdrawn), 
     (not_sure, is_recipient_received_the_expression_by_non_conversation), 
     (no,request_right_not_existed) 
    ]).
node(is_recipient_received_the_expression_by_non_conversation,'相对人是否通过非对话方式知道该意思表示的内容，比如通过短信，电子邮件，微信，QQ等方式接受到该要约。依据民法典第137条，以非对话方式发出的要约，以到达相对人时生效，比如进入相对人的特定系统，比如数据电文，微信以收到信息为准，以信件到达信箱或者电子邮箱为准。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_offer_withdrawn), 
     (not_sure, need_more_information),
     (no,request_right_not_existed)
    ]).
node(is_offer_withdrawn,'要约是否被撤回。依据民法典第475条，要约可以撤回，要约的撤回适用本法第141条的规定。141条规定，行为人可以撤回意思表示，撤回意思表示的通知应当在意思表示到达相对人前或者与意思表示同时到达相对人。比如在相对人收到要约信件前或者收到要约信件时，撤回要约的信件到达。微信等其他意思表示方式同理。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), 
     (not_sure, is_offer_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties), 
     (no, is_offer_revoked) 
    ]).
node(is_offer_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties,'要约是否在意思表示到达相对人前或者与意思表示同时到达相对人。依据民法典第141条，意思表示的撤回，以意思表示到达相对人前或者与意思表示同时到达相对人时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_offer_revoked)
    ]).
node(is_promise_established,'承诺是否成立。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_promise_invalid), 
     (not_sure, is_expression_of_intent_of_promise_established), 
     (no,request_right_not_existed) 
    ]).
node(is_promise_invalid,'承诺是否生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_promise_withdrawn), 
     (not_sure, is_promise_make_by_notice), 
     (no,request_right_not_existed) 
    ]).
node(is_promise_make_by_notice,'承诺是否以通知方式作出。比如通过媒体，网络，社交媒体，发布，广播，发布。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_promise_make_by_conversation), 
     (not_sure, is_promise_make_by_conversation), 
     (no,is_promise_do_not_need_notice) 
    ]).
node(is_promise_do_not_need_notice,'承诺是否不需要通知。比如在交易习惯中，约定进行某种行为就视为承诺。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_do_not_need_notice_be_maked), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_promise_do_not_need_notice_be_maked,'不需要通知的承诺是否作出？如果已经作出，按照民法典第484条第二款，承诺不需要通知的，根据交易习惯或者要约的要求作出承诺的行为时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_invalid), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_promise_make_by_conversation,'承诺的通知是否以对话方式作出。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_intent_of_promise_make_to_specific_party), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_of_promise_make_to_specific_party,'承诺的通知是否针对特定人作出。比如承诺是否对一个特定的公司或者个人作出，指定这个人与你进行交易。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_recipient_of_promise_received_the_expression), 
     (not_sure, need_more_information), 
     (no, is_expression_of_intent_of_promise_not_maked_to_specific_party) 
    ]).
node(is_expression_of_intent_of_promise_not_maked_to_specific_party,'承诺的通知是否没有针对特定人作出。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_of_non_specific_party_finished), 
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_promise_of_non_specific_party_finished,'无相对人的承诺是否完成。依据民法典第138条，无相对人的意思表示，表示完成时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_withdrawn), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_recipient_of_promise_received_the_expression,'承诺的接收方是否知道该意思表示的内容，根据民法典第484条，以通知方式作出的承诺，生效的时间适用本法第137条的规定。根据中华人民共和国民法典第137条，以对话方式作出的意思表示，相对人知道其内容或到达相对人相关电子系统时生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_withdrawn), 
     (not_sure, is_recipient_received_the_expression_by_conversation), 
     (no,request_right_not_existed) 
    ]).
node(is_recipient_of_promise_received_the_expression_by_conversation,'承诺的接收方是否通过对话方式知道该承诺的内容，比如通过通话，日常对话等方式接受到该要约。依据民法典第137条，以对话方式发出要约，以相对人知道要约内容为生效时间。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_withdrawn), 
     (not_sure, need_more_information),
     (no,is_recipient_received_the_expression_by_non_conversation)
    ]).
node(is_recipient_received_the_expression_by_non_conversation,'承诺的接收方是否通过非对话方式知道该承诺的内容，比如通过短信，电子邮件，微信，QQ等方式接受到该要约。依据民法典第137条，以非对话方式发出的要约，以到达相对人时生效，比如进入相对人的特定系统，比如数据电文，微信以收到信息为准，以信件到达信箱或者电子邮箱为准。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_withdrawn), 
     (not_sure, need_more_information),
     (no,request_right_not_existed)
    ]).
node(is_promise_withdrawn,'承诺是否被撤回。依据民法典第485条，承诺可以撤回，承诺的撤回适用本法第141条的规定。141条规定，行为人可以撤回意思表示，撤回意思表示的通知应当在意思表示到达相对人前或者与意思表示同时到达相对人。比如在相对人收到要约信件前或者收到要约信件时，撤回要约的信件到达。微信等其他意思表示方式同理。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed), 
     (not_sure, is_promise_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties), 
     (no, is_contract_invalid) 
    ]).
node(is_promise_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties,'承诺的撤回是否在意思表示到达相对人之前或者同时到达相对人。依据民法典第141条，意思表示到达相对人之前或者同时到达相对人，意思表示生效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_contract_invalid)
    ]).
node(is_expression_of_intent_of_promise_established,'意思表示是否成立？是否作出了相应的订立合同的意思表示，比如表明愿意或者不愿意订立合同，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_expression_of_intent_of_promise_be_maked_of_promise), %q22
     (not_sure, is_the_parties_has_explicit_and_objective_conduct_of_promise), %q7
     (no,request_right_not_existed) 
    ]).
node(is_the_parties_has_explicit_and_objective_conduct_of_promise,'是否存在客观的意思表示？可以简单理解为是否作出了行为，比如签名，点头，握手，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_there_intent_behind_the_conduct_of_promise), %q22
     (not_sure, need_more_information), %q7
     (no,request_right_not_existed) 
    ]).
node(is_there_intent_behind_the_conduct_of_promise,'该客观的意思表示是否存在主观意愿？可以简单理解为行为是否体现了你作出行为的内心意愿，比如你可能醉酒情况下点头并不代表认同相应的合同条款，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_expression_of_intent_be_maked_of_promise), %q22
     (not_sure, need_more_information), %q7
     (no,request_right_not_existed) 
    ]).
node(is_expression_of_intent_be_maked_of_promise,'意思表示是否作出？是否以某种方式作出了意思表示，比如明示，或者沉默，明示比如通过直接的言语，书面订购，默示包括在特定交易情况下无须通过直接的意思表示即可成立，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题', 
    [(yes, is_promise_invalid), %q22
     (not_sure, is_there_an_explicit_expression_of_intent_of_promise), %q7
     (no,request_right_not_existed) 
    ]).
node(is_there_an_explicit_expression_of_intent_of_promise,'是否存在明示的意思表示，比如信件，言语表示，或者行为，比如特定交易情况下的手势，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_invalid), 
     (not_sure, need_more_information), 
     (no,is_there_an_implicit_expression_of_intent_of_promise) 
    ]).
node(is_there_an_implicit_expression_of_intent_of_promise,'是否存在默示的意思表示，比如合同到期承租人继续使用租赁物，出租人没有异议的，租赁合同继续有效，包括无人值守的超市，标明收费的停车场，使用其服务时默认作出了相应的意思表示，如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure', 
    [(yes, is_promise_invalid), 
     (not_sure, need_more_information), 
     (no,request_right_not_existed) 
    ]).
node(is_offer_revoked,'要约是否被撤销。要约的撤销和撤回是完全不同的概念，要约一旦撤回则表明要约根本不存在，从未生效。而要约的撤销表明，要约已经成立生效，但是，被撤销后丧失其效力。一般情况下，要约只要符合要求可以撤回，而要约撤销存在特殊情况，一旦出现特殊情况，则即使条件满足也不可以进行撤销。依据民法典第477条，撤销要约的意思表示以对话方式作出的，该意思表示的内容应当在受要约人作出承诺之前为受要约人所知道；撤销要约的意思表示以非对话方式作出的，应当在受要约人作出承诺之前到达受要约人。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, request_right_not_existed),
     (not_sure, is_offer_revoked_by_conversation),
     (no, is_offer_null_and_void)
    ]).
node(is_offer_revoked_by_conversation,'撤销要约是否以对话方式作出。依据民法典第477条，撤销要约的意思表示以对话方式作出的，该意思表示的内容应当在受要约人作出承诺之前为受要约人所知道。比如在对话过程中，在对方未承诺接受条件之前撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_the_revoke_fell_into_exception),
     (not_sure, is_offer_revoked_by_conversation_by_non_conversation),
     (no, is_offer_revoked_by_non_conversation)
    ]).
node(is_offer_revoked_by_conversation_by_non_conversation,'撤销要约是否以非对话方式作出。依据民法典第477条，撤销要约的意思表示以非对话方式作出的，应当在受要约人作出承诺之前到达受要约人。比如在作出承诺期限之前，对方尚未回复是否接受相关的条件，这个时候通过信件，短信或者微信等方式，告知对方撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_the_revoke_fell_into_exception),
     (not_sure, need_more_information),
     (no, is_offer_revoked_by_non_conversation)
    ]).
node(is_the_revoke_fell_into_exception,'撤销要约是否符合不可撤销特殊情况。依据民法典第476条，要约可以撤销，但是有下列情形之一的除外：（一）要约人以确定承诺期限或者其他形式明示要约不可撤销；（二）受要约人有理由认为要约是不可撤销的，并已经为履行合同做了合理准备工作。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, is_offer_null_and_void),
     (not_sure, is_offer_unrevoked),
     (no, is_offer_null_and_void)
    ]).
node(is_offer_unrevoked,'要约是否不可撤销。依据民法典第476条，要约人以确定承诺期限或者其他形式明示要约不可撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_offer_null_and_void),
     (not_sure, need_more_information),
     (no, is_offeree_has_reasons_to_believe_offer_is_irrevocable)
    ]).
node(is_offeree_has_reasons_to_believe_offer_is_irrevocable,'受要约人有合理理由相信要约不可撤销。依据民法典第476条，受要约人已经为履行合同做了合理准备工作，则要约不得撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_offer_null_and_void),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_offer_null_and_void,'要约是否失效。要约的失效意思是要约已经失去效力，依据民法典第478条，要约失效存在多种情形，包括要约被拒绝，被依法撤销，承诺期限届满未作出承诺，受要约人已经作出实质性变更，跟原来要约内容不同了。撤销属于其中一种，若前面已经撤销，请直接选择yes。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个细化问题',
    [(yes, request_right_not_existed),
     (not_sure, is_offer_be_rejected),
     (no, is_promise_established)
    ]).
node(is_offer_be_rejected,'要约是否被拒绝。依据民法典第478条，要约被拒绝，则要约失效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, the_offeree_fails_to_make_an_acceptance_on_time)
    ]).
node(the_offeree_fails_to_make_an_acceptance_on_time,'是否承诺期限届满，受要约人未作出承诺。依据民法典第478条，承诺期限届满，受要约人未作出承诺，则要约失效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
    (not_sure, need_more_information),
    (no,the_offeree_materially_alter_the_content_of_offer)
    ]).
node(the_offeree_materially_alter_the_content_of_offer,'受要约人是否已经作出实质性变更，跟原来要约内容不同了。依据民法典第478条，要约被实质性变更，则要约失效。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
    (not_sure, need_more_information),
    (no,is_promise_established)
    ]).
node(is_contract_revoked,'合同是否被撤销。依据民法典第152条，合同被撤销后不具有任何法律效力。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, is_revoke_right_of_misunderstanding_over_time_period),
     (no,is_contract_performance_impossible)
    ]).
node(is_revoke_right_of_misunderstanding_over_time_period, '根据民法典第152条第二款，当事人自民事法律行为发生之日起五年内没有行使撤销权的，撤销权消灭。是否相关合同签订已经超过五年时间？若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_coercion),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_based_on_substantial_misunderstanding)
    ]).
node(is_civil_juristic_act_based_on_substantial_misunderstanding,'是否存在基于重大误解撤销合同。重大误解指的是对合同的主要内容存在实质性的误解，比如基于重大误解订立的合同，导致合同交易的货物与自己想要的货物完全不同。依据民法典第147条，基于重大误解实施的民事法律行为，行为人有权请求人民法院或者仲裁机构予以撤销。。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure进入下一个问题',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, is_misunderstanding_the_nature_of_the_contract),
     (no,is_civil_juristic_act_as_a_result_of_fraud)
    ]).
node(is_misunderstanding_the_nature_of_the_contract,'是否对合同的性质产生误解。比如将买卖合同误以为赠与合同，将有偿借用的合同视为免费借用的合同。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, need_more_information),
     (no,is_misunderstanding_regarding_the_other_party)
    ]).
node(is_misunderstanding_regarding_the_other_party,'是否对对方当事人产生误解，比如想要跟A公司吴经理签订合同，却错误跟B公司吴经理签订了合同。如果不确定，请点击not sure',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, need_more_information),
     (no, is_misunderstanding_regarding_the_quality_of_the_subject_matter)
    ]).
node(is_misunderstanding_regarding_the_quality_of_the_subject_matter,'是否对合同交易的物品的质量存在误解。比如将名画的复制品误以为是真迹进行买卖属于重大误解，但如果是以为一块石头会带来好运进行买卖，但结果并没有带来好运，则不属于重大误解，因为这里对买卖物品的物理质量并没有产生错误的认识。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, need_more_information),
     (no,is_misunderstanding_regarding_the_type_and_specifications_of_the_subject_matter)
    ]).
node(is_misunderstanding_regarding_the_type_and_specifications_of_the_subject_matter,'是否对合同交易的物品的品种和规格存在误解，特别是对同类物品。比如将名贵的红酒视为普通红酒进行买卖，或者将万吨液压机误以为千吨液压机进行购买。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, need_more_information),
     (no,is_misunderstanding_regarding_the_price_or_remuneration)
    ]).
node(is_misunderstanding_regarding_the_price_or_remuneration,'是否对合同交易的价款或者报酬存在误解。比如将价值标价100元的商品视为10000元的上商品，或者将10元的报酬误以为1000元的报酬。如果不确定或者不属于以上这些情形,请点击not sure',
    [(yes, is_revoke_right_of_misunderstanding_distinguished),
     (not_sure, need_more_information),
     (no, is_civil_juristic_act_as_a_result_of_fraud)
    ]).
node(is_revoke_right_of_misunderstanding_distinguished, '基于重大误解的撤销权是否消灭，根据中华人民共和国第152条第一款第一项，重大误解的当事人自知道或者应当知道撤销事由之日起九十日内没有行使撤销权，撤销权消灭',
    [(yes,is_civil_juristic_act_as_a_result_of_fraud),
     (not_sure, need_more_information),
     (no,is_revoke_right_of_misunderstanding_be_expressly_given_up)
    ]).
node(is_revoke_right_of_misunderstanding_be_expressly_given_up,'当事人知道撤销事由后是否明确表示或者以自己的行为表明放弃撤销权，根据民法典第152条第一款第三项，当事人知道撤销事由后明确表示或者以自己的行为表明放弃撤销权,撤销权消灭。若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_fraud),
     (not_sure, need_more_information),
     (no,is_contract_revoked_by_legal_institution_due_to_misunderstanding)
    ]).
node(is_contract_revoked_by_legal_institution_due_to_misunderstanding,'对合同产生误解的人是否已经提交法院或仲裁机构申请撤销合同，或者已经被法院撤销合同了。根据民法典第155条，被无效或者撤销的民事法律行为自始没有法律约束力。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_civil_juristic_act_as_a_result_of_fraud)
    ]).
node(is_civil_juristic_act_as_a_result_of_fraud,'是否基于欺诈行为撤销合同。依据民法典第148条，一方以欺诈手段，使对方在违背真实意思的情况下实施的民事法律行为，受欺诈方有权请求人民法院或者仲裁机构予以撤销。是否如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, defrauding_party_has_the_intent_to_deceive),
     (no,is_civil_juristic_act_as_a_result_of_coercion)
    ]).
node(defrauding_party_has_the_intent_to_deceive,'欺诈实施的人是否具有欺诈故意，若没有欺诈故意，即欺诈方并不是故意让对方陷入错误认知的，不可撤销。若不确定，请点击not sure',
    [(yes, defrauding_party_commit_fraudulent_action),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_coercion )
    ]).
node(defrauding_party_commit_fraudulent_action,'欺诈人实施了欺诈行为，即欺诈人有外部的表示行为，比如伪造了合同，虚假广告。若不确定，请点击not sure',
    [(yes, defrauded_party_has_fallen_into_a_false_beleif),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_coercion )
    ]).
node(defrauded_party_has_fallen_into_a_false_beleif,'欺诈人实施了欺诈行为使与其订立合同的人陷入了错误的认知或确信。比如误以为该公司具有相应的运营资质，但实际是伪造出来的资质。若不确定，请点击not sure',
    [(yes, the_defrauded_party_has_made_a_expression_of_intent_based_on_the_fraud),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_coercion )
    ]).
node(the_defrauded_party_has_made_a_expression_of_intent_based_on_the_fraud,'欺诈人实施了欺诈行为使与其订立合同的人因为欺诈的内容导致错误的认知而作出合同相关的意思表示。比如误以为该公司具有相应的运营资质，而作出与公司签订相关合同的行为。若不确定，请点击not sure',
    [(yes, is_revoke_right_of_fraud_distinguished),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_coercion )
    ]).
node(is_revoke_right_of_fraud_distinguished, '基于欺诈行为的撤销权是否消灭，根据民法典第152条第二款第一项，当事人自知道或者应当知道撤销事由之日起一年内没有行使撤销权,撤销权消灭.若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_coercion),
     (not_sure, need_more_information),
     (no, is_revoke_right_of_fraud_be_expressly_given_up)
    ]).
node(is_revoke_right_of_fraud_be_expressly_given_up, '当事人知道撤销事由后是否明确表示或者以自己的行为表明放弃撤销权，根据民法典第152条第二款第三项，当事人知道撤销事由后明确表示或者以自己的行为表明放弃撤销权,撤销权消灭。若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_coercion),
     (not_sure, need_more_information),
     (no,is_contract_revoked_by_legal_institution_due_to_fraud)
    ]).
node(is_contract_revoked_by_legal_institution_due_to_fraud,'被欺诈人是否已经提交法院或仲裁机构申请撤销合同，或者已经被法院撤销合同了。根据民法典第155条，被无效或者撤销的民事法律行为自始没有法律约束力。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_coercion)
    ]).
node(is_civil_juristic_act_as_a_result_of_coercion,'是否基于胁迫行为撤销合同。依据民法典第150条，一方或者第三人以胁迫手段，使对方在违背真实意思的情况下实施的民事法律行为，受胁迫方有权请求人民法院或者仲裁机构予以撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_revoke_right_distinguished_of_coercion),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_is_obviously_unfair)
    ]).
node(is_revoke_right_distinguished_of_coercion,'基于胁迫行为的撤销权是否消灭，根据民法典第152条第二款第二项，当事人受胁迫，自胁迫行为终止之日起一年内没有行使撤销权没有行使撤销权,撤销权消灭',
    [(yes,is_civil_juristic_act_as_a_result_of_unfair),
     (not_sure, need_more_information),
     (no,is_revoke_right_of_coercion_be_expressly_given_up)
    ]).
node(is_revoke_right_of_coercion_be_expressly_given_up,'当事人知道撤销事由后是否明确表示或者以自己的行为表明放弃撤销权，根据民法典第152条第二款第三项，当事人知道撤销事由后明确表示或者以自己的行为表明放弃撤销权,撤销权消灭。若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_unfair),
     (not_sure, need_more_information),
     (no,is_contract_revoked_by_legal_institution_due_to_coercion)
    ]).
node(is_contract_revoked_by_legal_institution_due_to_coercion,'被胁迫人是否已经提交法院或仲裁机构申请撤销合同，或者已经被法院撤销合同了。根据民法典第155条，被无效或者撤销的民事法律行为自始没有法律约束力。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_civil_juristic_act_as_a_result_of_unfair)
    ]).
node(is_civil_juristic_act_is_obviously_unfair,'是否基于明显不公正行为撤销合同。比如利用处于危困状态签订的合同，比如合同一方家中有重病患者，为治疗卖房，此时买房者利用其急用钱的危困状态，以远低于市场价的价格购入该房屋。依据民法典第151条，一方利用对方处于危困状态、缺乏判断能力等情形，致使民事法律行为成立时显失公平的，受损害方有权请求人民法院或者仲裁机构予以撤销。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, is_revoke_right_distinguished_of_unfair),
     (not_sure, need_more_information),
     (no,is_promise_established)
    ]).
node(is_revoke_right_distinguished_of_unfair,'基于明显不公平行为的撤销权是否消灭，根据民法典第152条第一款第一项，当事人自知道或者应当知道撤销事由之日起一年内没有行使撤销权,撤销权消灭',
    [(yes,is_contract_performance_impossible),
     (not_sure, need_more_information),
     (no,is_revoke_right_of_unfair_be_expressly_given_up)
    ]).
node(is_revoke_right_of_unfair_be_expressly_given_up,'当事人知道撤销事由后是否明确表示或者以自己的行为表明放弃撤销权，根据民法典第152条第二款第三项，当事人知道撤销事由后明确表示或者以自己的行为表明放弃撤销权,撤销权消灭。若不确定，请点击not sure',
    [(yes,is_civil_juristic_act_as_a_result_of_unfair),
     (not_sure, need_more_information),
     (no,is_contract_revoked_by_legal_institution_due_to_unfair)
    ]).
node(is_contract_revoked_by_legal_institution_due_to_unfair,'当事人是否已经提交法院或仲裁机构申请撤销合同，或者已经被法院撤销合同了。根据民法典第155条，被无效或者撤销的民事法律行为自始没有法律约束力。如果确定请根据是或否输入yes或者no,如果不确定,请输入not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_contract_performance_impossible)
    ]).
node(is_contract_performance_impossible,'合同是否存在履行不能的情况？比如合同事实上履行不了，比如买卖珍稀花瓶，但该花瓶已经被打碎，无法履行.根据民法典第580条但书， 当事人一方不履行非金钱债务或者履行非金钱债务不符合约定的，对方可以请求履行，但是有下列情形之一的除外：（一）法律上或者事实上不能履行；（二）债务的标的不适于强制履行或者履行费用过高；（三）债权人在合理期限内未请求履行。有前款规定的除外情形之一，致使不能实现合同目的的，人民法院或者仲裁机构可以根据当事人的请求终止合同权利义务关系，但是不影响违约责任的承担。如果不确定，请点击not sure',
    [(yes, request_right_not_existed),
     (not_sure, is_perfomance_legally_imossible),
     (no, is_liability_attributality)
    ]).
node(is_perfomance_legally_imossible,'是否合同法律上或事实上履行不能，法律上履行不能，指的是履行该合同会导致与法律规定冲突，比如破产时强制履行债权人合同，可能会违反破产法的规定。事实上履行不能，比如买卖的特定花瓶已经损害，或者指定的画家已经去世，无法作画。如果不确定，请点击not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more-information),
     (no, is_perfomance_economically_impossible)
    ]).
node(is_perfomance_economically_impossible,'是否债务的标的不适于强制履行或者履行费用过高。比如海运货物掉入海中，要求从海中捞出原有货物成本过高。如果不确定，请点击not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_the_loaner_did_not_ask_to_performance_within_reasonable_time)
    ]).
node(is_the_loaner_did_not_ask_to_performance_within_reasonable_time,'债权人在合理期限内是否未请求履行？如果不确定，请点击not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_liability_attributality)
    ]).
node(is_liability_attributality,'是否因为不可抗力免除责任？据民法典第590条，当事人一方因不可抗力不能履行合同的，根据不可抗力的影响，部分或者全部免除责任，但是法律另有规定的除外。因不可抗力不能履行合同的，应当及时通知对方，以减轻可能给对方造成的损失，并应当在合理期限内提供证明。当事人迟延履行后发生不可抗力的，不免除其违约责任。',
    [(yes, need_more_information),
     (not_sure, need_more_information),
     (no, is_loss_occur)
    ]).
node(is_loss_occur,'不履行合同, 或者不按约定履行合同是否造成了损害？根据民法典第584条，当事人一方不履行合同义务或者履行合同义务不符合约定，造成对方损失的，损失赔偿额应当相当于因违约所造成的损失，包括合同履行后可以获得的利益；但是，不得超过违约一方订立合同时预见到或者应当预见到的因违约可能造成的损失。',
    [(yes, is_causal_relationship_exist),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_causal_relationship_exist,'损害与合同当事人的违约行为是否具有因果关系?造成的损害是否因为违约而造成？比如约定时间取货，但因为取货人延迟取货，造成仓库管理费用上升，那么违约行为与增加的仓库费用就具有因果关系。如果确实未及时取货，但货物遭受损失是因为仓库管理者疏忽，那么货物损失的费用不属于赔偿损失范围。在哪种范围内具有因果关系',
    [(yes, is_request_right_extinguishment),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_request_right_extinguishment,'请求损害赔偿的权利是否消灭？根据民法典第557条，第五百五十七条  有下列情形之一的，债权债务终止：（一）债务已经履行；（二）债务相互抵销；（三）债务人依法将标的物提存；（四）债权人免除债务；（五）债权债务同归于一人；（六）法律规定或者当事人约定终止的其他情形。合同解除的，该合同的权利义务关系终止。但存在一些情况可能导致请求消灭。比如债务已经履行，或者因为违约人已经采取相应措施避免相应损害的造成，从而不必全额赔偿；或者损失和收益相同，因而抵消。如果不确定，请选择not sure',
    [(yes, request_right_not_existed),
     (not_sure, is_the_debt_has_been_performed),
     (no,is_request_right_exercisable)
    ]).
node(is_the_debt_has_been_performed,'债务是否已经履行，当事人是否已经履行合同规定的债务？如果是，债权债务关系终止，不能请求其赔偿违约损失。如果不确定，选择not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_the_debts_have_been_offset_against_each_other)
    ]).
node(is_the_debts_have_been_offset_against_each_other,'债务是否相互抵消，债权债务人之间的债务是否相互抵消，如果是，债权债务关系终止。如果不确定，请选择not sure',
    [(yes,request_right_existed),
     (not_sure, need_more_information),
     (no,is_the_debt_has_deposited)
    ]).
node(is_the_debt_has_deposited,'债务人是否将相应的合同相关的物品进行了提存，提存指的是债务人已经将履行合同相关的物品交给了提存部门，从而消灭债务的行为。如果是，债权债务关系消灭。如果不确定，请选择not sure',
    [(yes, request_right_existed),
     (not_sure, need_more_information),
     (no,is_the_creditor_waived_the_debt)
    ]).
node(is_the_creditor_waived_the_debt,'债权人是否免除了债务，债权人是否免除了债务人相关的债务，致使债权债务关系结束。如果不确定，选择not sure',
    [(yes, request_right_existed),
     (not_sure, need_more_information),
     (no, is_the_right_and_obligation_merge_into_one_person)
    ]).
node(is_the_right_and_obligation_merge_into_one_person, '债权债务是否因为转让，或者其他原因，归为同一个人，也就是同一个人即是债权人也是债务人，如果是，则债权债务关系终止。如果不确定，请选择not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_the_contract_terminated)
    ]).
node(is_the_contract_terminated,'合同是否解除，若合同解除，则合同的权利义务关系终止。无权请求履行，如果不确定，请选择not sure',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_request_right_exercisable)
    ]).
node(is_request_right_exercisable,'被请求履行的合同相对人是否具有不履行的理由？即被请求方是否存在可以请求不行使的权利，比如双方互相负担债务，约定了履行顺序，一方未履行，另一方也可以不履行？如果不确定，请选择not sure进入下一个问题',
    [(yes, request_right_not_existed),
     (not_sure, is_both_parties_owe_obligations_to_each_other),
     (no, request_right_existed)
    ]).
node(is_both_parties_owe_obligations_to_each_other,'双方是否互相负担债务？一般的合同，比如钱货交易，以金钱购买货物，一般都属于双务合同，即双方都附有相应的义务，一方需要支付价款，另一方需要交付货物。如果不确定，请选择not sure。',
    [(yes, is_there_a_right_of_simultaneous_performance_defense_exist),
     (not_sure, need_more_information),
     (no, is_there_defence_of_limitation_period_exist)
    ]).
node(is_there_a_right_of_simultaneous_performance_defense_exist,'对方是否存在同时履行抗辩权？一般互相负担债务，没有特殊约定的情况下，就属于同时履行抗辩权的情况。同时履行抗辩权的消失当对方提出履行的时候消失。比如约定100万购买轿车，只要对方提出支付100万，那么就必须履行交付轿车的义务。同时履行抗辩权作用于，当对方未提出支付100万的时候，可以以需要同时履行为由拒绝交付轿车。根据民法典第525条，当事人互负债务，没有先后履行顺序的，应当同时履行。一方在对方履行之前有权拒绝其履行请求。一方在对方履行债务不符合约定时，有权拒绝其相应的履行请求。如果不确定，请选择not sure',
    [(yes, is_any_party_performe_the_contract),
     (not_sure, need_more_information),
     (no, is_there_a_right_of_first_performance_defense_exist)
    ]).
node(is_any_party_performe_the_contract,'我方是否履行或者提出履行，按照民法典第525条的规定，当事人互负债务，没有先后履行顺序的，应当同时履行。一方在对方履行之前有权拒绝其履行请求.如果不确定，请选择not sure',
    [(yes,is_performance_of_simultaneous_meet_the_requiremen),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).
node(is_performance_of_simultaneous_meet_the_requirement,'同时履行的情况下，履行一方（我方）是否不符合履行的约定，根据民法典第525条，如果一方在对方履行债务不符合约定时，有权拒绝其相应的履行请求。',
    [(yes, request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_there_defense_of_limitation_period_exist)
    ]).
node(is_there_a_right_of_first_performance_defense_exist,'对方是否存在先履行抗辩权？先履行抗辩权指的是依照合同约定，一方应当先履行合同义务，后履行的一方可以要求先履行的一方先履行合同义务。如果我方按合同约定必须先履行，那么对方拥有先履行抗辩权。按照民法典第526条规定，当事人互负债务，有先后履行顺序，应当先履行债务一方未履行的，后履行一方有权拒绝其履行请求。先履行一方履行债务不符合约定的，后履行一方有权拒绝其相应的履行请求。如果不确定，请选择not sure',
    [(yes,is_first_performance_performe),
     (not_sure, need_more_information),
     (no, is_there_a_right_of_unsafe_performance_defense_exist)
    ]).
node(is_first_performance_performe,'先履行的人(我方）是否已经履行？按照民法典第526条规定，当事人互负债务，有先后履行顺序，应当先履行债务一方未履行的，后履行一方有权拒绝其履行请求。如果不确定，情点击not sure',
    [(yes, is_performance_of_first_performance_meet_the_requirement),
     (not_sure, need_more_information),
     (no,request_right_not_existed)
    ]).
node(is_performance_of_first_performance_meet_the_requirement,'我方履行是否符合约定? 按照民法典第526条，先履行一方履行债务不符合约定的，后履行一方有权拒绝其相应的履行请求。如果不确定，请点击not sure',
    [(yes, is_there_a_right_of_unsafe_performance_defense_exist),
     (not_sure, need_more_information),
     (no,request_right_not_existed)
    ]).
node(is_there_a_right_of_unsafe_performance_defense_exist,'对方是否存在不安抗辩权？不安抗辩权指的是，合同一方有确切的证据觉得另一方丧失或者可能丧失履行能力，从而不履行相应债务，来避免损失的抗辩权。比如签订合同之后，发现对方经营状况恶化，可能无法完成付款义务，可以中止履行，不交付货物。对方是否有相应的证据证明我方无法履行或者可能无法履行债务。民法典第527条规定，应当先履行债务的当事人，有确切证据证明对方有下列情形之一的，可以中止履行：（一）经营状况严重恶化；（二）转移财产、抽逃资金，以逃避债务；（三）丧失商业信誉；（四）有丧失或者可能丧失履行债务能力的其他情形。当事人没有确切证据中止履行的，应当承担违约责任。如果不确定，请选择not sure',
    [(yes, request_right_not_existed),
     (not_sure, is_there_sever_deterioration_in_business_operations_exist),
     (no, is_there_defense_of_limitation_period_exist)
    ]).
node(is_there_sever_deterioration_in_business_operations,'是否存在经营状况严重恶化的情况？比如是否公司负债率过高。如果不确定，情选择not sure',
    [(yes,request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_there_transferring_assets_or_withdrawing_funds_to_evade_debt_exist)
    ]).
node(is_there_transferring_assets_or_withdrawing_funds_to_evade_debt_exist,'是否存在转移财产，抽逃资金，以逃避债务的情况？比如是否存在股东抽逃资金，或者转移财产的情况。如果不确定，情选择not sure',
    [(yes,request_right_not_existed),
     (not_sure, need_more_information),
     (no, is_loss_of_commercial_credibility_exist)
    ]).
node(is_loss_of_commercial_credibility_exist,'是否存在丧失商业信誉的情况？比如是否存在拖欠款项，与其他公司有未结款项的情况。如果不确定，情选择not sure',
    [(yes,request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_other_circumstance_of_loss_or_potential_loss_ability_to_perform_the_obligation_exist)
    ]).
node(is_other_circumstance_of_loss_or_potential_loss_ability_to_perform_the_obligation_exist,'是否存在丧失或者可能丧失履行债务能力的其他情况？是否有其他有证据证明的类似情况。如果不确定，情选择not sure',
    [(yes,request_right_not_existed),
     (not_sure, need_more_information),
     (no,is_there_defense_of_limitation_period_exist)
    ]).
node(is_there_defense_of_limitation_period_exist,'对方是否存在时效抗辩权？自我方知道或者应当知道权利受到损害之日起，是否超过三年。按照民法典第192条，诉讼时效期间届满的，义务人可以提出不履行义务的抗辩。诉讼时效期间届满后，义务人同意履行的，不得以诉讼时效期间届满为由抗辩；义务人已经自愿履行的，不得请求返还。按照民法典第188条规定，第一百八十八条  向人民法院请求保护民事权利的诉讼时效期间为三年。法律另有规定的，依照其规定。诉讼时效期间自权利人知道或者应当知道权利受到损害以及义务人之日起计算。法律另有规定的，依照其规定。但是，自权利受到损害之日起超过二十年的，人民法院不予保护，有特殊情况的，人民法院可以根据权利人的申请决定延长。如果不确定，请选择not sure',
    [(yes, is_counterparty_willing_to_performe_the_contract_after_time_limitation),
     (not_sure, need_more_information),
     (no, request_right_existed)
    ]).
node(is_counterparty_willing_to_performe_the_contract_after_time_limitation,'对方存在时效抗辩权但仍继续履行？也即是我方要求对方履行，对方可以以超过三年为理由拒绝履行，但对方仍然同意履行的，不得再以时效超过作为抗辩权。如果不确定，请点击not sure',
    [(yes, request_right_existed),
     (not_sure, need_more_information),
     (no, request_right_not_existed)
    ]).

% root
% node(root, '是否有合同?', 
% 	[(yes, is_contract_invalid),
% 	 (no, request_right_not_estinguished),
% 	 (not_sure, request_right_exercisable)
% 	]).

% node(is_contract_invalid, '合同是否无效？', 
% 	[(yes, end_is_contract_established),
% 	%  (not_sure, q7),
% 	%  (no, q4)
% 	]).
% node(request_right_established, '责任是否建立', 
% 	[(yes, is_liability_established),
% 	 (no, liability_range)
% 	]).

% node(is_liability_established, '是否有合同？', 
% 	[(yes, is_contract_established),
% 	 (not_sure, is_contract_invalid),
% 	 (no, is_contract_unsettle)
% 	]).



end(request_right_existed, '存在违约损害赔偿请求权，对话结束。').
end(request_right_not_existed, '不存在违约损害赔偿请求权，对话结束。').
end(need_more_information, '需要更多信息确定是否存在违约损害赔偿请求权，对话结束。').


toChinese(root_is_contract_established, '合同是否成立?').
toChinese(is_contract_invalid, '合同是否无效?').
toChinese(is_offer_existed, '要约是否存在?').
toChinese(is_promise_existed, '承诺是否存在?').
toChinese(is_offer_established, '要约是否成立?').
toChinese(lack_of_civil_conduct_capacity, '是否无民事行为能力?').
toChinese(is_expression_of_intent_established, '意思表示是否成立?').
toChinese(is_the_parties_has_explicit_and_objective_conduct, '是否存在客观条件上的意思表示?').
toChinese(is_there_intent_behind_the_conduct, '是否存在主观条件上的意思表示?').
toChinese(is_expression_of_intent_be_maked, '意思表示是否作出？').
toChinese(is_there_an_explicit_expression_of_intent, '是否存在明示意思表示？').
toChinese(is_there_an_implicit_expression_of_intent, '是否存在默示意思表示？').
toChinese(is_misrepresentation_exist, '是否存在虚假意思表示?').
toChinese(is_contract_violate_law_or_administrative_regulation, '合同是否违反法律或相应行政法规?').
toChinese(is_contract_aim_to_damage_others_legitimate_right_and_interest_by_colluding_with_another_party, '合同是否双方恶意串通，损害他人利益?').
toChinese(is_contract_unsettle, '合同是否效力待定?').
toChinese(is_any_parties_between_8_to_18_years_old, '合同任意方年龄是否处于8-18周岁?').
toChinese(is_the_contract_a_pure_acquisition_of_benefits_or_is_made_according_to_age, '合同是否是纯获利益或与其年龄智力相适应').
toChinese(is_the_legal_representative_recognized, '法定代理人是否追认？').
toChinese(is_the_legal_representative_does_not_respond_after_30_days_upon_recipt_of_notice, '法定代理人追认是否超过30天未回应').
toChinese(wether_party_to_the_contract_lacks_the_authority_to_act_as_an_agent, '是否无权代理?').
toChinese(is_the_principle_recognized, '有权代理人是否追认？').
toChinese(is_the_principle_does_not_respond_after_30_days_upon_recipt_of_notice, '有权代理人是否超过30天未追认').
toChinese(is_any_parties_below_8_years_old, '合同相对人是否小于8周岁？').
toChinese(is_any_parties_adult_but_lack_of_capacity, '合同相对人是否成年但无民事行为能力?').
toChinese(is_offer_invalid, '要约是否无效?').
toChinese(is_expression_of_intent_make_to_specific_party, '意思表示是否针对特定相对人作出?').
toChinese(is_expression_of_intent_not_maked_to_specific_party, '意思表示是否针对不特定相对人作出?').
toChinese(is_expression_of_non_specific_party_finished, '无相对人的意思表示是否完成?').
toChinese(is_expression_of_intent_maked_by_announcement, '是否公示的意思表示?').
toChinese(is_expression_of_announcement_published, '公告是否已发布?').
toChinese(is_expression_of_intent_make_by_conversation, '要约是否以对话方式作出?').
toChinese(is_recipient_received_the_expression, '相对人是否知道或应当知道意思表示?').
toChinese(is_recipient_received_the_expression_by_non_conversation, '意思表示是否以非对话方式作出?').
toChinese(is_offer_withdrawn, '要约是否撤回？').
toChinese(is_offer_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties, '撤回是否与要约同时或在要约前到达相对人？').
toChinese(is_promise_established, '承诺是否成立？').
toChinese(is_promise_invalid, '承诺是否无效?').
toChinese(is_promise_make_by_notice, '承诺是否以通知发出?').
toChinese(is_promise_do_not_need_notice, '承诺是否非通知方式?').
toChinese(is_promise_do_not_need_notice_be_maked, '无需承诺通知是否作出?').
toChinese(is_promise_make_by_conversation, '承诺的通知是否以对话方式作出?').
toChinese(is_expression_of_intent_of_promise_make_to_specific_party, '承诺通知是否针对特定相对人').
toChinese(is_expression_of_intent_of_promise_not_maked_to_specific_party, '承诺通知是否针对不特定相对人？').
toChinese(is_promise_of_non_specific_party_finished, '无相对人的承诺是否完成').
toChinese(is_recipient_of_promise_received_the_expression, '承诺的接收方是否知道该意思表示的内容?').
toChinese(is_recipient_of_promise_received_the_expression_by_conversation, '承诺接收方是否通过对话方式知道该承诺内容？').
toChinese(is_recipient_received_the_expression_by_non_conversation, '承诺接收方是否通过非对话方式知道承诺的内容').
toChinese(is_promise_withdrawn, '承诺是否撤回？').
toChinese(is_promise_withdrawn_before_or_at_the_same_time_when_the_expression_of_intent_reached_the_other_parties, '承诺撤回是否在到达相对人之前或者同时到达').
toChinese(is_expression_of_intent_of_promise_established, '承诺意思表示是否成立?').
toChinese(is_the_parties_has_explicit_and_objective_conduct_of_promise, '是否存在客观的承诺意思表示?').
toChinese(is_there_intent_behind_the_conduct_of_promise, '是否存在主观要件的承诺意思表示?').
toChinese(is_expression_of_intent_be_maked_of_promise, '承诺意思表示是否作出?').
toChinese(is_there_an_explicit_expression_of_intent_of_promise, '承诺是否存在明示的意思表示?').
toChinese(is_there_an_implicit_expression_of_intent_of_promise, '承诺是否存在默示的意思表示?').
toChinese(is_offer_revoked, '要约是否撤销?').
toChinese(is_offer_revoked_by_conversation_by_non_conversation, '撤销要约是否以非对话方式作出?').
toChinese(is_the_revoke_fell_into_exception, '要约是否不可撤销？').
toChinese(is_offer_unrevoked, '要约是否依据约定不可撤销？').
toChinese(is_offeree_has_reasons_to_believe_offer_is_irrevocable, '受要约人是否有合理理由相信要约不可撤销？').
toChinese(is_offer_null_and_void, '要约是否失效?').
toChinese(is_offer_be_rejected, '要约是否被拒绝?').
toChinese(the_offeree_fails_to_make_an_acceptance_on_time, '是否承诺期限届满未作出承诺?').
toChinese(the_offeree_materially_alter_the_content_of_offer, '受要约人是否作出实质变更，跟原来要约内容不同?').
toChinese(is_contract_revoked, '合同是否被撤销?').
toChinese(is_revoke_right_of_misunderstanding_over_time_period, '撤销权是否消灭').
toChinese(is_civil_juristic_act_based_on_substantial_misunderstanding, '是否存在重大误解可以撤销合同').
toChinese(is_misunderstanding_the_nature_of_the_contract, '是否对合同的性质产生误解').
toChinese(is_misunderstanding_regarding_the_other_party, '是否对当事人产生误解?').
toChinese(is_misunderstanding_regarding_the_quality_of_the_subject_matter, '是否对质量产生误解？').
toChinese(is_misunderstanding_regarding_the_type_and_specifications_of_the_subject_matter, '是否对标的物的品种和规格存在误解').
toChinese(is_misunderstanding_regarding_the_price_or_remuneration, '是否对合同交易的价款或者报酬存在误解？').
toChinese(is_revoke_right_of_misunderstanding_distinguished, '重大误解撤销权是否消灭?').
toChinese(is_revoke_right_of_misunderstanding_be_expressly_given_up, '是否放弃撤销权?').
toChinese(is_contract_revoked_by_legal_institution_due_to_misunderstanding, '法院仲裁机构是否已经撤销?').
toChinese(is_civil_juristic_act_as_a_result_of_fraud, '是否可因欺诈撤销?').
toChinese(defrauding_party_has_the_intent_to_deceive, '欺诈是否存在故意?').
toChinese(defrauding_party_commit_fraudulent_action, '欺诈人是否实施了欺诈行为?').
toChinese(defrauded_party_has_fallen_into_a_false_beleif, '欺诈行为使欺诈人陷入错误认知或确信?').
toChinese(the_defrauded_party_has_made_a_expression_of_intent_based_on_the_fraud, '相关意思表示基于被欺诈的错误认知而表示?').
toChinese(is_revoke_right_of_fraud_distinguished, '欺诈撤销权是否消灭?').
toChinese(is_revoke_right_of_fraud_be_expressly_given_up, '当事人是否放弃欺诈撤销权?').
toChinese(is_contract_revoked_by_legal_institution_due_to_fraud, '欺诈合同是否已被法院或仲裁机构撤销？').
toChinese(is_civil_juristic_act_as_a_result_of_coercion, '是否可基于胁迫撤销合同？').
toChinese(is_revoke_right_distinguished_of_coercion, '基于胁迫的撤销权是否消灭？').
toChinese(is_revoke_right_of_coercion_be_expressly_given_up, '撤销权人是否放弃?').
toChinese(is_contract_revoked_by_legal_institution_due_to_coercion, '胁迫合同是否已被法院或仲裁机构撤销?').
toChinese(is_civil_juristic_act_is_obviously_unfair, '合同是否利用处于危困状态而签订?').
toChinese(is_revoke_right_distinguished_of_unfair, '利用危困状态的撤销权是否消灭?').
toChinese(is_revoke_right_of_unfair_be_expressly_given_up, '危困状态撤销权人是否放弃?').
toChinese(is_contract_revoked_by_legal_institution_due_to_unfair, '危困状态合同是否被法院或仲裁机构撤销？').
toChinese(is_contract_performance_impossible, '合同是否履行不能？').
toChinese(is_perfomance_legally_imossible, '合同是否法律上或事实上履行不能').
toChinese(is_perfomance_economically_impossible, '是否不适于强制履行或者履行费用过高').
toChinese(is_the_loaner_did_not_ask_to_performance_within_reasonable_time, '债权人是否在合理期限内请求履行？').
toChinese(is_liability_attributality, '是否因不可抗力免除责任').
toChinese(is_loss_occur, '是否造成损害？').
toChinese(is_causal_relationship_exist, '损害与违约是否存在因果关系？').
toChinese(is_request_right_extinguishment, '请求权是否未消灭？').
toChinese(is_the_debt_has_been_performed, '债务是否已履行？').
toChinese(is_the_debts_have_been_offset_against_each_other, '债务是否相互抵消？').
toChinese(is_the_debt_has_deposited, '是否已提存？').
toChinese(is_the_creditor_waived_the_debt, '债务是否已免除？').
toChinese(is_the_right_and_obligation_merge_into_one_person, '债权债务合归一人？').
toChinese(is_the_contract_terminated, '合同是否解除？').
toChinese(is_request_right_exercisable, '请求权是否可行使？').
toChinese(is_both_parties_owe_obligations_to_each_other, '是否是双务合同？').
toChinese(is_there_a_right_of_simultaneous_performance_defense_exist, '是否存在同时履行抗辩权').
toChinese(is_any_party_performe_the_contract, '是否一方提出履行？').
toChinese(is_performance_of_simultaneous_meet_the_requirement, '履行一方是否不符合约定？').
toChinese(is_there_a_right_of_first_performance_defense_exist, '是否存在先履行抗辩权？').
toChinese(is_first_performance_performe, '先履行人是否履行？').
toChinese(is_performance_of_first_performance_meet_the_requirement, '履行是否符合约定？').
toChinese(is_there_a_right_of_unsafe_performance_defense_exist, '是否存在不安抗辩权？').
toChinese(is_there_sever_deterioration_in_business_operations_exist, '是否经营状况恶化的情况？').
toChinese(is_there_transferring_assets_or_withdrawing_funds_to_evade, '是否转移财产，抽逃资金逃避债务的情况？').
toChinese(is_loss_of_commercial_credibility_exist, '是否丧失商业信誉？').
toChinese(is_other_circumstance_of_loss_or_potential_loss_ability_to_perform_the_obligation_exist, '是否存在其他丧失履行债务能力的情况？').
toChinese(is_there_defense_of_limitation_period_exist, '是否存在时效抗辩权？').
toChinese(is_counterparty_willing_to_performe_the_contract_after_time_limitation, '是否放弃时效抗辩权继续履行？').


ask(Q, NewQ) :-
	\+ end(Q, _),
	node(Q, Text, Children),
	print(Text), nl,
	read(Answer),
	member((Answer, NewQ), Children).

ask(Q, end) :-
	end(Q, Text),
	write(Text), nl.

start_question_resolving(Node, History, Path, Result) :-
	ask(Node, NewNode),
	(
		NewNode = out_of_scope ->
			% 超出范围
			% format('根据您的描述，~n', []), 
			% print(History),
			% format('逻辑推理路径：~n~s~n', LogicPath), 
			% print(Result),
			Path = History,
			Result = out_of_scope;
		NewNode = end ->
			Path = [Node|History],
			Result = end;
			start_question_resolving(NewNode, [Node|History], Path, Result)
	).
	


% get_all_children(Node, Children) :-
% 	findall(Child, children(Node, Child), Children).

print_path([]).
print_path([X|Xs]) :-
	\+ end(X, _),
    toChinese(X, T),
	print(T),
	print( --> ),
	print_path(Xs).

print_path([X|_]) :-
	end(X, _),
    toChinese(X, T),
	print(T), nl.


print_path_o([]).
print_path_o([X|Xs]) :-
	\+ end(X, _),
	print(X),
	print( --> ),
	print_path_o(Xs).

print_path_o([X|_]) :-
	end(X, _),
	print(X), nl.

consultation_loop :-
	start_question_resolving(root_is_contract_established, [], Path, Result),
	% format('根据您的描述，~n', []), 
	reverse(Path, PathR),
	
	print(逻辑推理路径), nl,
    print_path_o(PathR), nl,
	print_path(PathR).
	% format('逻辑推理路径：~n~s~n', LogicPath), 
