import 'package:flutter/material.dart';
import 'package:trelltech/container.dart';
import 'package:trelltech/features/boards/domain/entities/board_entity.dart';
import 'package:trelltech/features/boards/domain/services/board_service.dart';
import 'package:trelltech/features/boards/presentation/widget/board_form.dart';
import 'package:trelltech/features/boards/presentation/widget/board_list_element.dart';
import 'package:trelltech/features/organization/domain/arguments/organization_arguments.dart';

class Boards extends StatefulWidget{
  OrganizationArguments arguments;


  Boards(this.arguments, {super.key});

  @override
  State<Boards> createState() => _BoardsState();
}

class _BoardsState extends State<Boards> {
  final BoardService _boardService = sl<BoardService>();


  Future<List<BoardEntity>> ? _boards;

  @override
  void initState() {
    _getBoards();
    super.initState();
  }

  void _getBoards() async {
    setState(() {
      _boards = _boardService.getBoardByOrganizationIdAsync(widget.arguments.organizationId);;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white70),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Action pour retourner à la page précédente
          },
        ),
        title: const Text(
          "Mes boards",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true, // Centre le titre de l'AppBar
      ),
      floatingActionButton: _buildFloatingButton(context),
      body: FutureBuilder(future: _boards, builder: (BuildContext context, AsyncSnapshot<List<BoardEntity>> listBoard) {
        if (!listBoard.hasData) {
          return const Text('Loading...');
        }
        return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: listBoard.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return BoardListElement(listBoard.data![index], _showBottomSheet);
            }
        );
      }
    ),
    );
  }

  Widget _buildFloatingButton(BuildContext context){
    return FloatingActionButton(onPressed: ()=> _showBottomSheet(BoardEntity(), (organizationEntity) async {
      organizationEntity.idOrganization = widget.arguments.organizationId;

      await _boardService.createBoardAsync(organizationEntity);
      _getBoards();
    }));
  }

  _showBottomSheet(BoardEntity organizationEntity, Function(BoardEntity) onSubmitAction) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context){
          return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BoardForm(board: organizationEntity, onSubmitAction: onSubmitAction),
              ));
    });
  }
}