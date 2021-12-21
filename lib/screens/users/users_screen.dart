import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_calendar/screens/users/components/users_list.dart';
import 'package:work_calendar/shared/components/loader/loader.dart';
import 'package:work_calendar/shared/utils/input_utils.dart';
import 'package:work_calendar/store/store_service.dart';

class UsersScreen extends StatefulWidget {
  final List<dynamic> users;
  final bool loading;
  
  const UsersScreen({ Key? key, required this.users, required this.loading }): super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  UsersScreen get widget => super.widget;
  
  @override
  void initState() {
    super.initState();
    
    StoreService.fetchUsers();
  }

  void _cancelSearch() {
    _searchController.text = '';
    StoreService.searchUsers('');
  }

  void _handleSearch(String value) {
     StoreService.searchUsers(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.loading ? 
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(child: Loader(),),
        ) : SafeArea(
              child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 15),
                    height: 80,
                    child: CupertinoTextField(
                        placeholder: 'Введите',
                        onChanged: debounce(_handleSearch),
                        controller: _searchController,
                        padding: const EdgeInsets.only(left: 5, top: 6, bottom: 6),
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.search, color: Colors.grey[700]!,),
                        ), 
                        suffix: _searchController.text.isNotEmpty ?
                          GestureDetector(
                            onTap: () {
                              _cancelSearch();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child:  Icon(Icons.cancel, color: Colors.grey[700]!)//Text('Отмена', style: TextStyle(color: Colors.grey[700]!),),
                            ),
                          ) : null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.grey)
                        ),
                        style: const TextStyle(fontSize: 20),
                      ),),
                  ),
                Expanded(
                  flex: 1,
                  child: widget.users.isNotEmpty ? 
                    NotificationListener<ScrollNotification>(
                      onNotification: (details) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        return true;
                      },
                      child: UsersList(users: widget.users, loading: widget.loading)
                    ) : 
                    const Center(
                      child: Text('¯\\_( ͡❛ ͜ʖ ͡❛)_/¯', 
                        style: TextStyle(fontSize: 50, color: Colors.blue),
                      ),
                    ),
                )
              ],
            )
        )
    );
  }
}
