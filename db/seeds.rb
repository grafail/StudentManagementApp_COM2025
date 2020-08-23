# frozen_string_literal: true

Course.create!([
                   { title: 'Computer Science', year: 2020, courseType: 'BSc' },
                   { title: 'Aerospace Engineering', year: 2020, courseType: 'BSc' },
                   { title: 'Economics', year: 2020, courseType: 'BSc' }
               ])

User.create!([
               { firstname: 'John', lastname: 'Doe', email: 'test@example.org', password: '123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil },
               { firstname: 'Jane', lastname: 'Doe', email: 'test2@example.org', password: '123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, course_id: 1 },
               { firstname: 'Joe', lastname: 'Bloggs', email: 'test3@example.org', password: '123456', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
             ])

Subject.create!([
                  { course_id: 1, user_id: 1, description: 'Advances related to energy efficiency issues and cost reductions have resulted in the rapid growth and deployment of networked devices and sensing/actuation systems that connect the physical word with the cyber-world. The number of devices connected to the Internet already exceeds the number of people on earth and is estimated to grow to 50 billion devices by 2020. The resulting framework, which is known as the Internet of Things (IoT), incorporates a number of technologies, including wireless sensor networks, pervasive systems, ambient intelligence, context-awareness and distributed systems. This module will provide an overview of the key concepts and enabling technologies for the Internet of Things, including: Wireless Sensor Networks, Platforms (Hardware, Software), Machine-to-Machine communications (M2M), protocols and standards (e.g. 6LowPAN, ZigBee, CoAp), semantic technologies, and data and information processing mechanisms.', title: 'Internet of Things' },
                  { course_id: 1, user_id: 1, description: 'A distributed system is built of a network of computing devices, which coordinate their actions via message passing to achieve a common goal. Typically, system components are assumed to operate concurrently, lack a global clock and to fail independently. This module shall build and consolidate your knowledge of advanced algorithms, computer networking and/or parallel computing. You shall learn to describe the principles of distributed systems, such as communication, scheduling and fault tolerance as well as to compare and contrast between a broad set of instances of distributed systems, algorithms and protocols (e.g., peer-to-peer systems, distributed hash tables, MixNets, distributed ledger technologies) within the context of various applications.', title: 'Distributed Systems' },
                  { course_id: 1, user_id: 1, description: 'This module gives an introductory yet up-to-date description of the fundamental technologies of computational Intelligence, including evolutionary computation, neural computing and their applications. Main streams of evolutionary algorithms and meta-heuristics, including genetic algorithms, evolution strategies, genetic programming, particle swarm optimization will be taught. Basic neural network models and learning algorithms will be introduced. Interactions between evolution and learning, real-world applications to optimization and robotics, and recent advances will also be discussed.', title: 'Computational Intelligence' },
                  { course_id: 3, user_id: 1, description: 'The module introduces the main concepts of macroeconomic analysis, starting from microeconomic behaviour of consumers and firms.', title: 'Principles of Macroeconomics' },
                  { course_id: 3, user_id: 1, description: 'This module covers the necessary basic mathematics topics and descriptive statistics and exploratory data analysis which are necessary for the subsequent maths and statistics modules in level one.', title: 'Quantitative Methods' },
                  { course_id: 2, user_id: 1, description: 'An introductory course in mechanical engineering drawing, CAD, design and workshop practice.', title: 'Design & Component Production' },
                  { course_id: 2, user_id: 1, description: 'First year common module to all programmes in the Department of Mechanical Engineering Sciences. This is an introductory module in electronics for non-electronic/electrical engineering students. It builds a basic understanding of electrical concepts, circuits and instruments relevant to later modules in the course.', title: 'Electronic Instrumentation' }
                ])
Assessment.create!([
                     { subject_id: 1, name: 'COURSEWORK' },
                     { subject_id: 1, name: '2 HOUR WRITTEN CLOSED BOOK EXAMINATION' },
                     { subject_id: 2, name: 'INDIVIDUAL CW A: DISTRIBUTED SYSTEM TOOL & DESIGN' },
                     { subject_id: 2, name: 'GROUP CW B: DISTRIBUTED SYSTEM DESIGN & IMPLEMENTATION' },
                     { subject_id: 2, name: '2 HOUR UNSEEN EXAMINATION' }
                   ])
Enrollment.create!([
                     { user_id: 2, subject_id: 1 }
                   ])
Grade.create!([
                { assessment_id: 1, user_id: 2, grade: 70.0 },
                { assessment_id: 2, user_id: 2, grade: 75.0 }
              ])

User.all[0].grant :staff
User.all[1].grant :student
User.all[2].grant :admin