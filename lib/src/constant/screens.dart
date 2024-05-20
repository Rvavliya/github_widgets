import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/view/animation/animation.dart';
import 'package:flutter_gallery/src/view/audio/just_audio/just_audio_player.dart';
import 'package:flutter_gallery/src/view/back_drop_effect/back_drop_effect.dart';
import 'package:flutter_gallery/src/view/countries_world_map/countries_world_map.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino.dart';
import 'package:flutter_gallery/src/view/date_picker/date_picker.dart';
import 'package:flutter_gallery/src/view/image_cropper/image_cropper.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/api/api_examples.dart';
import 'package:flutter_gallery/src/view/bottem_navigationbar_example/bottombar_examples.dart';
import 'package:flutter_gallery/src/view/buttons/button_types.dart';
import 'package:flutter_gallery/src/view/chart/chart.dart';
import 'package:flutter_gallery/src/view/checkbox/common_checkbox.dart';
import 'package:flutter_gallery/src/view/chip/chip_widgtes.dart';
import 'package:flutter_gallery/src/view/color_picker/color_picker.dart';
import 'package:flutter_gallery/src/view/google_map_location/current_location.dart';
import 'package:flutter_gallery/src/view/pageview/pageview.dart';
import 'package:flutter_gallery/src/view/pdf_viewer/pdf_viewer.dart';
import 'package:flutter_gallery/src/view/qr_code/qr_code.dart';
import 'package:flutter_gallery/src/view/radio_button/radio_button.dart';
import 'package:flutter_gallery/src/view/sliver_appbar/sliver_appbar_example.dart';
import 'package:flutter_gallery/src/view/diloag_box/diloagbox.dart';
import 'package:flutter_gallery/src/view/diloag_box/download_progress_diloag/downloading_progress.dart';
import 'package:flutter_gallery/src/view/download/download_demo.dart';
import 'package:flutter_gallery/src/view/download/downloader/download_ui.dart';
import 'package:flutter_gallery/src/view/drop_down/drop_down.dart';
import 'package:flutter_gallery/src/view/file_picker/multifile_picker.dart';
import 'package:flutter_gallery/src/view/file_share/file_share.dart';
import 'package:flutter_gallery/src/view/fitted_box/fitted_box.dart';
import 'package:flutter_gallery/src/view/font_awsome_icom/font_awsom_icon.dart';
import 'package:flutter_gallery/src/view/gridView/gridview.dart';
import 'package:flutter_gallery/src/view/image/image_demo.dart';
import 'package:flutter_gallery/src/view/listview_builder/listview.dart';
import 'package:flutter_gallery/src/view/print_jsonfiledata/jsonfiledata.dart';
import 'package:flutter_gallery/src/view/showmodel_sheet/modelsheet.dart';
import 'package:flutter_gallery/src/view/slidebar/sliderbar.dart';
import 'package:flutter_gallery/src/view/snackbar/snackbar_example.dart';
import 'package:flutter_gallery/src/view/stepper/stepper.dart';
import 'package:flutter_gallery/src/view/svg_images/svg_images.dart';
import 'package:flutter_gallery/src/view/switch/switch_examples.dart';
import 'package:flutter_gallery/src/view/tab_bar/tab_bar_example.dart';
import 'package:flutter_gallery/src/view/table/table_view.dart';
import 'package:flutter_gallery/src/view/textFileds/text_form_fileds.dart';
import 'package:flutter_gallery/src/view/vibration/haptic_feedback.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/video_player.dart';
import 'package:flutter_gallery/src/view/wrap/wrap_example.dart';
import 'package:flutter_gallery/src/view/wrap_or_more/wrapor_more.dart';

class ScreenNavigation {
  static final List<Screens> screensData = [
    const Screens(
        fileName: Strings.textFileds, navigation: TextFormFieldsScreen()),
    const Screens(fileName: Strings.filePicker, navigation: MultiFilePicker()),
    const Screens(fileName: Strings.getApi, navigation: GetApiExample()),
    const Screens(fileName: Strings.shareExample, navigation: FileShare()),
    const Screens(
        fileName: Strings.fontAwsomeIcon, navigation: FontAwsomeIcon()),
    const Screens(fileName: Strings.sVGImages, navigation: SvgImages()),
    const Screens(fileName: Strings.dropDown, navigation: CustomDropDown()),
    const Screens(fileName: Strings.checkBox, navigation: CommonCheckBox()),
    const Screens(fileName: Strings.slideBar, navigation: SliderBarMain()),
    const Screens(fileName: Strings.chip, navigation: ChipExample()),
    const Screens(fileName: Strings.charts, navigation: ChartExample()),
    const Screens(
        fileName: Strings.listViewBuilder, navigation: ListViewExample()),
    const Screens(fileName: Strings.gridview, navigation: GridviewExample()),
    const Screens(fileName: Strings.switchString, navigation: SwitchExamples()),
    const Screens(fileName: Strings.buttonTypes, navigation: ButtonTypes()),
    const Screens(fileName: Strings.imageDownload, navigation: ImageDownload()),
    const Screens(fileName: Strings.wrap, navigation: WrapWidgetExample()),
    const Screens(
        fileName: Strings.wrapOrMore, navigation: WrapOrMoreExample()),
    const Screens(fileName: Strings.printJsonData, navigation: JsonData()),
    const Screens(fileName: Strings.fittedBox, navigation: FittedBoxExample()),
    const Screens(
        fileName: Strings.showModalBottomSheetExample,
        navigation: ShowModelBottemSheetExample()),
    const Screens(fileName: Strings.dialogBox, navigation: DiloagBoxExample()),
    const Screens(
        fileName: Strings.downloadProgressDiloag,
        navigation: DownloadProgressDiloag()),
    const Screens(
        fileName: Strings.downloadProgress, navigation: DownloadedFile()),
    const Screens(
        fileName: Strings.bottemNavigatorBar,
        navigation: BottemNavigationBarExampleFile()),
    const Screens(fileName: Strings.tabBar, navigation: TabBarExample()),
    const Screens(fileName: Strings.image, navigation: ImageExample()),
    const Screens(
        fileName: Strings.sliverAppBar, navigation: SliverAppBarExample()),
    const Screens(
        fileName: Strings.videoPlayer, navigation: VideoPlayerExample()),
    const Screens(
        fileName: Strings.userLocation, navigation: UserCurrentLocation()),
    const Screens(
        fileName: Strings.imageCropper, navigation: ImageCropperExample()),
    const Screens(fileName: Strings.tableView, navigation: TableViewExample()),
    const Screens(fileName: Strings.pageView, navigation: PageViewExample()),
    const Screens(
        fileName: Strings.colorPicker, navigation: ColorPickerExample()),
    const Screens(fileName: Strings.pdfViewer, navigation: PdfViewerExample()),
    const Screens(
        fileName: Strings.radioButton, navigation: RadioButtonExample()),
    const Screens(
        fileName: Strings.audioPlayer, navigation: JustAudioPlayerExample()),
    // const Screens(fileName: "Model View", navigation: ModelView()),
    const Screens(
        fileName: Strings.backDropEffect, navigation: BackDropEffectExample()),
    const Screens(
        fileName: Strings.countriesWorldMap,
        navigation: CountriesWorldMapExample()),
    const Screens(fileName: Strings.qrCode, navigation: QrCodeExample()),
    const Screens(fileName: Strings.stepper, navigation: StepperExample()),
    const Screens(
        fileName: Strings.cupertinoWidgtes, navigation: CupertinoExample()),
    const Screens(fileName: Strings.animation, navigation: AnimationExample()),
    const Screens(
        fileName: Strings.datePicker, navigation: DatePickerExample()),
    const Screens(fileName: Strings.snackBar, navigation: SnackBarExample()),
    const Screens(fileName: Strings.vibaration, navigation: VibrationExample()),
  ];
}
